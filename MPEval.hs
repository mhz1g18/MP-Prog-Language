{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleContexts #-}
module MPEval where
import MPTokens
import MPGrammar
import Control.Monad
import Control.Monad.State
import Control.Monad.Reader
import Control.Monad.Identity
import Data.Maybe
import Data.Map (Map)
import qualified Data.Map as Map
import Data.List

data Value 
     = IntVal Int
     | IntStreamVal [[Int]]
     | BoolVal Bool
     | StringVal String
     | UnitVal
     deriving (Eq,Show)

type LocalEnv = Map String Value
type Env = Map FuncDec LocalEnv

prog = parseCalc $ alexScanTokens "main() {integer a=4;}"
stmts :: [Statement]
stmts = [VarDecAssign IntegerType "intVar" (Arith (I 1)),VarDecAssign IntegerType "result" (Arith (I 0)),Return $ Arith (Add (Variable "intVar") (Variable "result"))]

func_one, main_func :: FuncDec
func_one = FuncDec "intFunc" IntegerType [] [VarDecAssign IntegerType "intVar" (Arith (I 0))]
main_func = MainFunc [VarDecAssign BooleanType "boolVar" (Boolean (B False)), Return (Boolean (Or (Boolean (B True))(Variable "boolVar")))]


exprs :: [Expr]
exprs = [Arith $ Add (Arith $ Mul (Arith (I 3))(Arith (I 2))) (Arith (I $ -1))]
initial_env = Map.empty


updateLocalEnv :: Env -> FuncDec -> String -> Value -> Env
updateLocalEnv env fun x v =
 case (Map.lookup fun env) of
   Nothing -> Map.insert fun (Map.insert x v Map.empty) env
   Just e  -> case (Map.lookup x e) of
               Nothing -> Map.insert fun (Map.insert x v e) env
               Just v' -> Map.insert fun (Map.insert x v e) env

lookupFuncDec :: String -> Env -> Maybe FuncDec -- Returns a FuncDec from a function name
lookupFuncDec x env | length (Map.keys xs) /=1 = Nothing
                    | otherwise = Just . head $ Map.keys xs
                     where xs = Map.filterWithKey (\k _ -> funcDecPred x k) env
  
funcDecPred :: String -> FuncDec -> Bool
funcDecPred x (FuncDec y _ _ _) = x==y
funcDecPred _ _ = False

interpretProg :: Prog -> [Env]
interpretProg (Prog xs) = interpretFuncDec initial_env "main" main'
  where (xs'@(main':_),_) = partition isMainFunc xs

interpretFuncDec :: Env -> String -> FuncDec -> [Env]
interpretFuncDec env f func@(FuncDec _ _ _ xs) 
  | func `notElem` (Map.keys env) = let env' = Map.insert func (Map.empty) env in map (\s -> interpretStmt env' f s) xs
  | otherwise = map (\s -> interpretStmt env f s) xs
interpretFuncDec env f func@(MainFunc xs)
  | func `notElem` (Map.keys env) = let env' = Map.insert func (Map.empty) env in map (\s -> interpretStmt env' f s) xs
  | otherwise = map (\s -> interpretStmt env f s) xs

interpretStmt :: Env -> String -> Statement -> Env 
interpretStmt env f (VarDec t s) = env
interpretStmt env f (VarAssign s e)
   | isJust v && isJust func = updateLocalEnv env (fromJust func) s (fromJust v)
    where v = interpretExpr env f e ; func = lookupFuncDec f env
interpretStmt env f (VarDecAssign _ s e)
   | isJust v && isJust func = updateLocalEnv env (fromJust func) s (fromJust v)
    where v = interpretExpr env f e ; func = lookupFuncDec f env
interpretStmt env f (Return e) = env
interpretStmt env f (IfElse e (x:xs) (y:ys)) = undefined
interpretStmt env _ _ = env

interpretExpr :: Env -> String -> Expr -> Maybe Value
interpretExpr env f (Variable x) = 
 do
  func <- lookupFuncDec f env
  localEnv <- Map.lookup func env
  Map.lookup x localEnv
interpretExpr _ _ (IntStream xs) = return $ IntStreamVal xs
interpretExpr _ _ (StringExpr s) = return $ StringVal s
interpretExpr env f (FuncAppT (PrintFunc e)) = interpretExpr env f e >> return UnitVal
interpretExpr env f (FuncAppT (FuncApp g xs)) = 
 do
  func <- lookupFuncDec g env -- Check if the function invoked is in the environment. (Substitute arguments into function body)
  return UnitVal
interpretExpr env f (StreamAssign s x y e) =
  do
   e' <- interpretExpr env f e
   if isIntVal e' then return . IntVal . intValProj $ e' else Nothing                                            
interpretExpr env f (Bracket e) = interpretExpr env f e
interpretExpr env f (Arith x) =
 case x of
  I int -> return $ IntVal int
  Add e e' -> interpretArithExpr env f "+"  (e,e')
  Sub e e' -> interpretArithExpr env f "-"  (e,e')
  Mul e e' -> interpretArithExpr env f "*"  (e,e')
  Div e e' -> interpretArithExpr env f "\\" (e,e')
  Mod e e' -> interpretArithExpr env f "%"  (e,e')
interpretExpr env f expr@(Boolean x) =
 case x of
   B b -> return $ BoolVal b 
   LessThan e e' -> interpretBoolExpr env f "<" (e,e')
   Equality e e' -> interpretBoolExpr env f "==" (e,e')
   And e e' -> interpretBoolExpr env f "&&" (e,e') 
   Or e e'  -> interpretBoolExpr env f "||" (e,e')
   Not e  -> do
              v <- interpretExpr env f e
              when (not $ isBoolVal v) Nothing
              return . BoolVal . not . boolValProj $ v
----------------------------------------------------------------------------
interpretArithExpr :: Env -> String -> String -> (Expr,Expr) -> Maybe Value
interpretArithExpr env f s (x,y) = 
 do
  v <- interpretExpr env f x
  v'<- interpretExpr env f y
  when (not $ isIntVal v && isIntVal v') Nothing
  case s of
    "+" -> return . IntVal $ (+) (intValProj v) (intValProj v')
    "-" -> return . IntVal $ (-) (intValProj v) (intValProj v')
    "*" -> return . IntVal $ (*) (intValProj v) (intValProj v')
    "\\" -> do
             when (intValProj v' == 0) Nothing -- Division by Zero
             return . IntVal $ (div) (intValProj v) (intValProj v')
    "%" -> return . IntVal $ (mod) (intValProj v) (intValProj v')
    otherwise -> Nothing
----------------------------------------------------------------------------
interpretBoolExpr :: Env -> String -> String -> (Expr,Expr) -> Maybe Value
interpretBoolExpr env f s (x,y) = 
 do
  v <- interpretExpr env f x
  v'<- interpretExpr env f y
  when (not $ isBoolVal v && isBoolVal v') Nothing
  case s of
    "<"  ->  return . BoolVal $ (<) (boolValProj v) (boolValProj v')
    "==" ->  return . BoolVal $ (==) (boolValProj v) (boolValProj v')
    "&&" ->  return . BoolVal $ (&&) (boolValProj v) (boolValProj v')
    "||" ->  return . BoolVal $ (||) (boolValProj v) (boolValProj v')
    otherwise -> Nothing
----------------------------------------------------------------------------
{-
newtype Eval a = Eval (StateT Env (ReaderT Env Identity) a) deriving (Functor, Applicative,Monad, MonadState Env, MonadReader Env) 

lookupVarVal :: FuncDec -> String -> Eval Value
lookupVarVal f x = do
  env <- ask
  case (lookup f env) of
    Nothing -> return UnitVal
    Just e' -> case (lookup x e') of
                Nothing -> return UnitVal
                Just v' -> return v'

evalProg :: Prog -> Eval Value
evalProg _ = undefined

evalFuncDec :: FuncDec -> String -> Eval Value
evalFuncDec _ _ = undefined

evalExpr :: Expr -> String -> Eval Value
evalExpr _ _ = undefined

evalStmt :: Statement -> String -> Eval Value
evalStmt _ _ = undefined
---------------------------------------------------------------------------------------------------
interpretStmts :: [Statement] -> [LocalEnv] -- List of environments after each statement is executed
interpretStmts = (<$>) (\s -> interpretStmt initial_env s)

interpretExprs :: [Expr] -> Maybe Value
interpretExprs xs = do
                     values <- mapM (\e -> interpretExpr initial_env e) xs
                     return $ last values
       
interpretStmt :: LocalEnv -> Statement -> LocalEnv
interpretStmt env (VarDec t s) = env
interpretStmt env (VarAssign s e) 
  | isJust $ interpretExpr env e = (s,v) : env
   where v = fromJust $ interpretExpr env e 
interpretStmt env (VarDecAssign _ s e) 
  | isJust $ interpretExpr env e = (s,v) : env
   where v = fromJust $ interpretExpr env e 
interpretStmt env (Return e) = env
interpretStmt env (IfElse e (x:xs) (y:ys)) =
 case (interpretExpr env e) of
   Just (BoolVal True) ->  let env' = interpretStmt env x in last $ map (\s -> interpretStmt env' s) xs 
   Just (BoolVal False) -> let env' = interpretStmt env y in last $ map (\s -> interpretStmt env' s) ys
   _ -> env
interpretStmt env stmt@(ForLoop l b i xs) = interpretForLoop env stmt

interpretForLoop :: LocalEnv -> Statement -> LocalEnv
interpretForLoop env stmt@(ForLoop l b i xs)
 | isJust (interpretExpr env b) && isBoolVal (fromJust (interpretExpr env b)) =
   case l of
     LoopVarAssign s e -> g s e
     LoopVarDecAssign _ s e -> g s e 
   where g x y = case (interpretExpr env y) of
                  Nothing -> env
                  Just intVal@(IntVal v) -> case (interpretExpr ((x,intVal) : env) b) of -- Interpret boolean in updated environment with variable initialised 
                                             --Execute the list of statements in the updated environment (the variable is incremented/decremented)
                                             Just (BoolVal True) -> interpretForLoop (last $ map (\s -> interpretStmt env' s) xs) stmt 
                                             otherwise -> env
                                            where env' = case i of
                                                          Increment c -> (x, IntVal (v+c)) : env
                                                          Decrement c -> (x, IntVal (v-c)) : env
interpretForLoop env _ = env 
   
interpretExpr :: LocalEnv -> Expr -> Maybe Value
interpretExpr env (Variable v) = lookup v env
interpretExpr _   (IntStream xs) = return $ IntStreamVal xs
interpretExpr _   (StringExpr s) = return $ StringVal s
interpretExpr env (FuncAppT (PrintFunc e)) = interpretExpr env e >> return UnitVal
--interpretExpr env (FuncAppT f) 
interpretExpr env (Bracket e) = interpretExpr env e
interpretExpr env (StreamAssign s x y e) =
  do
   e' <- interpretExpr env e
   if isIntVal e' then return . IntVal . intValProj $ e' else Nothing
interpretExpr env expr@(Arith x) =
 case x of
   I v -> return $ IntVal v
   Add e e' -> interpretArithExpr env '+' (e,e')
   Sub e e' -> interpretArithExpr env '-' (e,e')
   Mul e e' -> interpretArithExpr env '*' (e,e')
   Div e e' -> interpretArithExpr env '\\' (e,e')
   Mod e e' -> interpretArithExpr env '%' (e,e')
interpretExpr env expr@(Boolean x) =
 case x of
   B b -> return $ BoolVal b 
   LessThan e e' -> interpretBoolExpr env '<' (e,e')
   Equality e e' -> interpretBoolExpr env 'e' (e,e')
   And e e' -> interpretBoolExpr env 'a' (e,e') 
   Or e e'  -> interpretBoolExpr env 'o' (e,e')
   Not e  -> do
              v <- interpretExpr env e
              when (not $ isBoolVal v) Nothing
              return . BoolVal . not . boolValProj $ v
              

interpretArithExpr :: LocalEnv -> Char -> (Expr,Expr) -> Maybe Value
interpretArithExpr env c (x,y) = 
 do
  v <- interpretExpr env x
  v'<- interpretExpr env y
  when (not $ isIntVal v && isIntVal v') Nothing
  case c of
    '+' -> return . IntVal $ (+) (intValProj v) (intValProj v')
    '-' -> return . IntVal $ (-) (intValProj v) (intValProj v')
    '*' -> return . IntVal $ (*) (intValProj v) (intValProj v')
    '\\' -> do
             when (intValProj v' == 0) Nothing -- Division by Zero
             return . IntVal $ (div) (intValProj v) (intValProj v')
    '%' -> return . IntVal $ (mod) (intValProj v) (intValProj v')
    otherwise -> Nothing

interpretBoolExpr :: LocalEnv -> Char -> (Expr,Expr) -> Maybe Value
interpretBoolExpr env c (x,y) = 
 do
  v <- interpretExpr env x
  v'<- interpretExpr env y
  when (not $ isBoolVal v && isBoolVal v') Nothing
  case c of
    '<'  -> return . BoolVal $ (<) (boolValProj v) (boolValProj v')
    'e' ->  return . BoolVal $ (==) (boolValProj v) (boolValProj v')
    'a' ->  return . BoolVal $ (&&) (boolValProj v) (boolValProj v')
    'o' ->  return . BoolVal $ (||) (boolValProj v) (boolValProj v')
    otherwise -> Nothing
-}

isMainFunc :: FuncDec -> Bool
isMainFunc (MainFunc _) = True
isMainFunc _ = False

isIntVal :: Value -> Bool
isIntVal (IntVal _) = True
isIntVal _ = False

intValProj :: Value -> Int
intValProj (IntVal i) = i
intValProj _ = error "Invalid proj"

isBoolVal :: Value -> Bool
isBoolVal (BoolVal _) = True
isBoolVal _ = False

boolValProj :: Value -> Bool
boolValProj (BoolVal b) = b