{
module MPGrammar where
import MPTokens
}

%name parseCalc
%tokentype { Token }
%error { parseError }

%token
  eol     { TokenEOL _ }
  '->'   { TokenArrow _ }
  integerType { TokenIntegerType _ }
  intStreamType { TokenIntStreamType _ }
  stringType  { TokenStringType _ }
  boolType    { TokenBoolType _ }
  unitType    { TokenUnitType _ }
  bool    { TokenBool _ $$}
  loop    { TokenLoop _ }
  if      { TokenIf _ }
  else    { TokenElse _ }
  print   { TokenPrint _ }
  return  { TokenReturn _ }
  main    { TokenMainFun _ }
  ';'     { TokenSemiColon _ }
  ':'     { TokenColon _ }
  ','     { TokenComma _ }
  '='     { TokenEq _ }
  '=='    { TokenBEq _ }
  '&&'    { TokenAnd _ }
  '||'    { TokenOr  _ }
  '+'     { TokenAdd _ }
  '-'     { TokenSub _} 
  '*'     { TokenMul _ }
  '/'     { TokenDiv _ }
  '%'     { TokenMod _ }
  '!'     { TokenNot _ }
  '<'     { TokenLessThan _ }
  '('     { TokenLParen _ }
  '['     { TokenLBracket _ }
  ')'     { TokenRParen _ }
  ']'     { TokenRBracket _ }
  '{'     { TokenLCurlyBracket _ }
  '}'     { TokenRCurlyBracket _ }
  var     { TokenVar _ $$}
  int     { TokenInt _ $$}
  string  { TokenString _ $$ }

%nonassoc integerType intStreamType stringType boolType bool loop print main return "'" ',' '(' '{' '[' ')' '}' ']' var int string
%nonassoc eol
%right '->'
%right ';'
%nonassoc if
%right else
%left '||'
%left '&&'
%left '==' '!'
%nonassoc '<'
%left '+' '-' 
%left '*' '/' '%'
%left NEG
%right '='

%%
-----------------------------------------------------------------------------
rev_list(p) : p { [$1] } | rev_list(p) p { $2 : $1 }
ord_list(p) : rev_list(p) { reverse $1 }
rev(xs) : xs { reverse $1 }
opt(p) : p { Just $1 } | {-empty-} { Nothing }
-----------------------------------------------------------------------------
Prog : FuncDecs { Prog $1 }

FuncDecs :: { [FuncDec] }
FuncDecs : ord_list(FuncDec) { $1 } 

Expr : Stream { IntStream $1 }
     | ArithExpr { Arith $1 }
     | BoolExpr  { Boolean $1 }
     | string { StringExpr $1 }
     | var { Variable $1 }
     | FuncApp { FuncAppT $1 }
     | '(' Expr ')' { Bracket $2 }
     | var '[' Expr ']' '[' Expr ']' '=' Expr { StreamAssign $1 $3 $6 $9 }

Statement : Type var ';' { VarDec $1 $2 }
          | var '=' Expr ';' { VarAssign $1 $3 }
          | Type var '=' Expr ';' { VarDecAssign $1 $2 $4 }
          | if Expr Block else Block { IfElse $2 $3 $5 }
          | loop '(' LoopInit ':' Expr ':' IncOrDec ')' Block { ForLoop $3 $5 $7 $9 }
          | return Expr ';' { Return $2 }

LoopInit : var '=' Expr ';'{ LoopVarAssign $1 $3} 
         | Type var '=' Expr ';' { LoopVarDecAssign $1 $2 $4 }

FuncApp : print '(' Expr ')' { PrintFunc $3 }
        | var unitType { FuncApp $1 [] } 
        | var '(' ArgsList ')' { FuncApp $1 $3 }

FuncParamList :: { [(String,Type)]}
FuncParamList : unitType { [] } | '(' ParamList ')' { $2 }

FuncDec : main unitType Block { MainFunc $3 }
        | Type var FuncParamList Block { FuncDec $2 $1 $3 $4 }

-------------------------------------------------------------
argsListRev :: { [Expr] }
argsListRev : Expr { [$1] } | argsListRev ',' Expr { $3 : $1 }

ArgsList :: { [Expr] }
ArgsList : rev(argsListRev) { $1 } 

ParamList :: { [(String,Type)]}
ParamList : Type var { [($2,$1)] } 
          | ParamList ',' Type var { ($4,$3) : $1 } 

Block :: { [Statement] }
Block : '{' ord_list(Statement) '}' { $2 }

--StreamRow(p) : ord_list(p) { $1 }
--StreamRow : streamRow { reverse $1 }

StreamRow : int { [$1] }
          | '-' int { [negate $2] }
          | StreamRow int { $1 ++ [$2]}
          | StreamRow '-' int { $1 ++ [negate $3] }

Stream :: {[[Int]]}
Stream : eol { [[]] }
       | StreamRow eol { $1 : [[]] }
       | Stream eol    { $1 ++ [[]] } 
       | Stream StreamRow eol { $1 ++ [$2] }

--Stream(p) : eol { [[]] }
--          | StreamRow(p) eol { $1 : [[]] }
--          | Stream(p) eol    { $1 ++ [[]] } 
--          | Stream(p) StreamRow(p) eol { $1 ++ [$2] }

ArithExpr : '-' int %prec NEG { I $ -$2 }
          | int { I $1 }
          | Expr '+' Expr { Add $1 $3 }
          | Expr '-' Expr { Sub $1 $3 }
          | Expr '*' Expr { Mul $1 $3 }
          | Expr '/' Expr { Div $1 $3 } 
          | Expr '%' Expr { Mod $1 $3 }

BoolExpr : bool  { B $1 }
         | Expr '<'  Expr { LessThan $1 $3 } 
         | Expr '==' Expr { Equality $1 $3 } 
         | Expr '&&' Expr { And $1 $3 }
         | Expr '||' Expr { Or $1 $3  }
         | '!' Expr { Not $2 }

Type : integerType { IntegerType } 
     | boolType { BooleanType }
     | stringType { StringType }
     | intStreamType { StreamType }
     | unitType { UnitType }
     | Type '->' Type { FunctionType $1 $3 }

IncOrDec : '+' int { Increment $2 }  | '-' int { Decrement $2 }

{
parseError :: [Token] -> a
parseError [] = error $ "Parse error - there are no tokens to parse!"
parseError (x:xs) = error $ "Parse error on token " ++ show x

parseString :: String -> Prog
parseString = parseCalc . alexScanTokens

--data Prog = StreamProg [[Int]] | StreamRowT [Int] | ArgsListT [Expr] deriving (Eq,Show)
data Prog = Prog [FuncDec] deriving (Eq,Show) 

data Expr 
     = IntStream [[Int]]
     | Arith ArithExpr
     | Boolean BoolExpr
     | StringExpr String
     | Variable String
     | FuncAppT FuncApp
     | Bracket Expr
     | StreamAssign String Expr Expr Expr -- variable_name, row_index, col_index, value
     deriving (Eq,Show)

data Statement
     = VarDec Type String
     | VarAssign String Expr
     | VarDecAssign Type String Expr
     | IfElse Expr [Statement] [Statement]
     | ForLoop LoopInit Expr IncOrDec [Statement]
     | Return Expr 
     deriving (Eq,Show)

data LoopInit
     = LoopVarAssign String Expr
     | LoopVarDecAssign Type String Expr
     deriving (Eq,Show)

data Block = Block [Statement] deriving (Eq,Show) -- List of one or more statements enclosed in curly braces

data Stream = Stream [[Int]] deriving (Eq,Show)

data StreamRow = StreamRow [Int] deriving (Eq,Show)

data FuncDec 
     = MainFunc [Statement]
     | FuncDec String Type [(String,Type)] [Statement] --Name OutputType ParamsList Block 
     deriving (Eq,Show)

data FuncApp
     = PrintFunc Expr
     | FuncApp String [Expr]
     deriving (Eq,Show)

data ParamList = ParamList [(String,Type)] deriving (Eq,Show)
data FuncParamList = FuncParamList [(String,Type)] deriving (Eq,Show)
data ArgsList = ArgsList [Expr] deriving (Eq,Show)     

data ArithExpr
     = I Int
     | Add Expr Expr
     | Sub Expr Expr
     | Mul Expr Expr
     | Div Expr Expr
     | Mod Expr Expr
     deriving (Eq,Show)

data BoolExpr
     = B Bool
     | LessThan Expr Expr
     | Equality Expr Expr
     | And Expr Expr
     | Or Expr Expr
     | Not Expr 
     deriving (Eq,Show)
    
data Type 
     = BooleanType
     | FunctionType Type Type
     | IntegerType 
     | StreamType 
     | StringType 
     | UnitType
     deriving (Eq,Show,Ord)

data IncOrDec = Increment Int | Decrement Int deriving (Eq,Show)

instance Ord FuncDec where
  compare (MainFunc xs ) (MainFunc ys)
    | (==) (length xs) (length ys) = EQ
    | (<)  (length xs) (length ys) = LT
    | otherwise = GT
  compare (MainFunc _) _ = LT
  compare (FuncDec _ _ _ _) (MainFunc _) = GT
  compare (FuncDec f t  _ _) (FuncDec g t' _ _)
    | compare f g == EQ = compare t t'
    | otherwise = compare f g
}