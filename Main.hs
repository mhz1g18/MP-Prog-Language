module Main where
import MPTokens
import MPGrammar
import Control.Monad.State
import Control.Monad.Except
import Data.Char
import Data.List
import Data.Map (Map)
import qualified Data.Map as Map

type TypeEnv = Map String Type
type EnvState = StateT Env IO
type Value a = ExceptT String (EnvState) a

data Env = Env {
 globalEnv :: Map FuncDec TypeEnv,
 currentFunc :: FuncDec
} deriving (Show)

prog = Prog [func_one]
func_one = FuncDec "intFunc" IntegerType [] [VarDecAssign IntegerType "intVar" (Arith (I 0))]
initial_env = Map.empty
functionType = FunctionType IntegerType (FunctionType (IntegerType) (BooleanType))

main :: IO ()
main = undefined

main' :: EnvState ()
main' = do
        t <- runExceptT $ typeOfProg prog
        case t of
         Left e -> liftIO . putStrLn . show $ "Type checker failed :\n" ++ show e
         Right t -> liftIO . putStrLn . show $ "Type checker succeeded :\n" ++ show t
--------------------------------------------------------------------
-- Functions for querying state of environment
getCurrentFuncDec :: Value FuncDec
getCurrentFuncDec = gets currentFunc

updateCurrentFunc :: FuncDec -> Value ()
updateCurrentFunc f = modify $ \env -> env { currentFunc = f }

insertBinding :: String -> Type -> Value ()
insertBinding x t = do
 f <- getCurrentFuncDec
 currentEnv <- gets globalEnv
 case (Map.lookup f currentEnv) of
  Nothing -> modify $ \env -> env { globalEnv = Map.insert f (Map.insert x t Map.empty) currentEnv }
  Just e' -> modify $ \env -> env { globalEnv = Map.insert f (Map.insert x t e') currentEnv }
  
getTypeOfVar :: String -> Value Type
getTypeOfVar x = do
 f <- getCurrentFuncDec
 currentEnv <- gets globalEnv
 case (Map.lookup f currentEnv) of
  Nothing -> throwError $ "There are no free variables in the function " ++ show f 
  Just e' -> case (Map.lookup x e') of
              Nothing -> throwError $ "The variable " ++ show x ++ " isn't in the scope of " ++ show f
              Just t -> return t

getFuncDecFromName :: String -> Value FuncDec
getFuncDecFromName x = do
 currentEnv <- gets globalEnv
 let filteredMap = Map.filterWithKey (\k _ -> funcDecPred k x) currentEnv
 case (Map.assocs filteredMap) of
  [] -> throwError $ "Cannot find the function " ++ show x ++ " in the program!"
  ((f',_):[]) -> return f'
  ((f',_):_) -> throwError $ "Unexpected error - There are multiple functions declared with the name " ++ show x ++ " in the program!"

funcDecPred :: FuncDec -> String -> Bool
funcDecPred (FuncDec f _ _ _) x = f==x
funcDecPred (MainFunc _) x = x=="main"

-------------------------------------------------------------------------------------------
-- Functions for creating the environment of a program
buildEnvFuncDec :: FuncDec -> Value ()
buildEnvFuncDec func@(FuncDec f t params xs) = do
 updateCurrentFunc func
 mapM buildEnvStmt xs
 return ()
buildEnvFuncDec func@(MainFunc xs) = do
 updateCurrentFunc func
 mapM buildEnvStmt xs
 return ()

buildEnvStmt :: Statement -> Value ()
buildEnvStmt (VarDec t x) = insertBinding x t
buildEnvStmt (VarAssign x e) = return ()
buildEnvStmt (VarDecAssign t x e) = insertBinding x t
buildEnvStmt (Return e) = return ()
buildEnvStmt (IfElse e xs ys) = do
  mapM buildEnvStmt xs
  mapM buildEnvStmt ys
  return ()
buildEnvStmt (ForLoop i e c xs) = undefined

buildEnvProg :: Prog -> Value ()
buildEnvProg (Prog xs) = do
  mapM buildEnvFuncDec xs
  updatedEnv <- get
  return ()

--------------------------------------------------------------------
-- Functions for type checking a program, given an environment
typeOfProg :: Prog -> Value Type
typeOfProg (Prog xs)
  | null $ mainFuncs = throwError "The program must have a main function defined"
  | (length mainFuncs) /= 1 = throwError "The program must only have ONE main function defined"
  | otherwise = do
                 buildEnvProg (Prog xs)
                 mapM typeOfFuncDec fs -- Check all of the functions (except from main) are well typed
                 typeOfFuncDec $ head mainFuncs --The type of the program is the type of the main function
   where (mainFuncs,fs) = partition isMainFunc xs

typeOfFuncDec :: FuncDec -> Value Type
typeOfFuncDec func@(MainFunc xs) = do
 updateCurrentFunc func
 stmtTypes <- mapM typeOfStatement xs
 return . last $ stmtTypes
typeOfFuncDec func@(FuncDec f t params xs) = do
 updateCurrentFunc func
 stmtTypes <- mapM typeOfStatement xs
 return . last $ stmtTypes

typeOfStatement :: Statement -> Value Type
typeOfStatement (VarDec t x) = return UnitType
typeOfStatement (VarAssign x e) = do
 t <- getTypeOfVar x
 t' <- typeOfExpr e
 if t==t' then return UnitType else throwError $ "Invalid assignment - Cannot match type of variable " ++ show t ++ " with " ++ show t'
typeOfStatement (VarDecAssign t x e) = do
 t' <- typeOfExpr e
 if t==t' then return UnitType else throwError $ "Invalid assignment - Cannot match type of variable " ++ show t ++ " with " ++ show t'
typeOfStatement (IfElse e xs ys) = do
 t <- typeOfExpr e
 if (not $ t==BooleanType) then (throwError $ "Expected boolean condition but received type " ++ show t) else g
 where g = do
            lTypes <- mapM typeOfStatement xs
            rTypes <- mapM typeOfStatement ys
            let lType = last lTypes
            let rType = last rTypes
            if (lType==rType) then return lType else throwError $ "Expected the types of the branches to match but received types " ++ show lType ++ " " ++ show rType
typeOfStatement (ForLoop l e i xs) = 
 case l of
  (LoopVarAssign x e) -> do
   t <- typeOfExpr e
   when (not $ t==IntegerType) (throwError $ "Expected an integer variable in the for loop initialisation but received type " ++ show t)
   b <- typeOfExpr e
   when (not $ b==BooleanType) (throwError $ "Expected a boolean condition in the for loop but received an expression of type " ++ show b)
   stmtTypes <- mapM typeOfStatement xs
   return $ last stmtTypes
  (LoopVarDecAssign t x e) -> do
   t' <- typeOfExpr e
   when (not $ t==IntegerType && t'==t) (throwError $ "Expected an integer variable in the for loop initialisation but received type " ++ show t)
   b <- typeOfExpr e
   when (not $ b==BooleanType) (throwError $ "Expected a boolean condition in the for loop but received an expression of type " ++ show b)
   stmtTypes <- mapM typeOfStatement xs
   return $ last stmtTypes           
typeOfStatement (Return e) = typeOfExpr e >> return UnitType

typeOfExpr :: Expr -> Value Type
typeOfExpr (IntStream xs) = if (isValidStream xs) then return StreamType else throwError $ "Invalid Stream " ++ show xs
typeOfExpr (Arith (I _)) = return IntegerType
typeOfExpr (Arith e ) = do
 let (x,y) = projArith e 
 t <- typeOfExpr x
 u <- typeOfExpr y
 if t==IntegerType && t==u then return IntegerType else throwError $ "Expected Integer types for arithmetric expression but received " ++ show t ++ " " ++ show u
typeOfExpr (Boolean (B _)) = return BooleanType
typeOfExpr (Boolean e) = do
 let (x,y) = projBool e
 t <- typeOfExpr x
 u <- typeOfExpr y
 if t==BooleanType && t==u then return BooleanType else throwError $ "Expected Boolean types for boolean expression but received " ++ show t ++ " " ++ show u
typeOfExpr (StringExpr _) = return StringType
typeOfExpr (Variable x) = getTypeOfVar x
typeOfExpr (FuncAppT (PrintFunc e)) = typeOfExpr e >>= (\t -> return $ FunctionType t UnitType)
typeOfExpr (FuncAppT (FuncApp x exprs)) = do
  f <- getFuncDecFromName x
  case f of
   (FuncDec f' t params _) -> do
     let fType = growFunction (fmap snd params) t
     argTypes <- mapM typeOfExpr exprs
     t' <- typeOfFuncApp fType argTypes
     if (isPrimitiveType t') then return t' else throwError "Error in function application!"
   (MainFunc _) -> throwError "Cannot apply arguments to main function"
typeOfExpr (Bracket e) = typeOfExpr e
typeOfExpr (StreamAssign x i j v) = do
 x' <- getTypeOfVar x
 v' <- typeOfExpr v
 if x'==StreamType then g else throwError $ "Expected variable to be a stream but received type " ++ show x'
 where g = do
            i' <- typeOfExpr i
            j' <- typeOfExpr j
            if i'==IntegerType && i'==j' then return UnitType else throwError $ "Expected the indices to be integer types but received " ++ show i' ++ " " ++ show j'
--------------------------------------------------
--Helper functions
projArith :: ArithExpr -> (Expr,Expr)
projArith (Add e e') = (e,e')
projArith (Sub e e') = (e,e')
projArith (Mul e e') = (e,e')
projArith (Div e e') = (e,e')
projArith (Mod e e') = (e,e')

projBool :: BoolExpr -> (Expr,Expr)
projBool (LessThan e e') = (e,e')
projBool (Equality e e') = (e,e')
projBool (And e e') = (e,e')
projBool (Or e e') = (e,e')
projBool (Not e ) = (e,e)

isFuncType :: Type -> Bool
isFuncType (FunctionType _ _) = True
isFuncType _ = False

isPrimitiveType :: Type -> Bool
isPrimitiveType = not . isFuncType

isValidStream :: [[Int]] -> Bool
isValidStream xxs 
            | all (\xs -> null xs) concList = True 
            | otherwise = all (\xs -> length xs == v) (tail concList)
              where concList = [ xs | xs<-xxs ] ; v = length $ head concList

lengthInt :: Int -> Int
lengthInt = length . map digitToInt . show . abs

growFunction :: [Type] -> Type -> Type -- List of input types, Output type
growFunction [] t = FunctionType UnitType t
growFunction [x] t = FunctionType x t
growFunction (x:xs) t = FunctionType x (growFunction xs t)

typeOfFuncApp :: Type -> [Type] -> Value Type -- Function, List of argument types
typeOfFuncApp f@(FunctionType t t') [] = throwError $ "No arguments to apply to the function " ++ show f
typeOfFuncApp f [] 
  | isPrimitiveType f = return f
  | otherwise = throwError $ "Error"
typeOfFuncApp (FunctionType t t') [x]
  | x==t = return t'
  | otherwise = throwError $ "Couldn't match the type " ++ show x ++ " with " ++ show t ++ " in function application"
typeOfFuncApp (FunctionType t t') (x:xs)
  | x==t = typeOfFuncApp t' xs
  | otherwise = throwError $ "Couldn't match the type " ++ show x ++ " with " ++ show t ++ " in function application"
typeOfFuncApp f xs = throwError $ "Error in function application"

isMainFunc :: FuncDec -> Bool
isMainFunc (FuncDec _ _ _ _) = False
isMainFunc (MainFunc _) = True