{
module MPGrammar where
import MPTokens
}

%name parseCalc
%tokentype { Token }
%error { parseError }

%token
  eol     { TokenEOL }
  '->'   { TokenArrow }
  integerType { TokenIntegerType }
  intStreamType { TokenIntStreamType }
  stringType  { TokenStringType }
  boolType    { TokenBoolType  }
  unitType    { TokenUnitType }
  bool    { TokenBool $$}
  loop    { TokenLoop }
  if      { TokenIf }
  else    { TokenElse }
  print   { TokenPrint }
  return  { TokenReturn }
  main    { TokenMainFun }
  ';'     { TokenSemiColon }
  ':'     { TokenColon }
  ','     { TokenComma }
  '='     { TokenEq }
  '=='    { TokenBEq }
  '&&'    { TokenAnd }
  '||'    { TokenOr  }
  '+'     { TokenAdd }
  '-'     { TokenSub }
  '*'     { TokenMul }
  '/'     { TokenDiv }
  '%'     { TokenMod }
  '!'     { TokenNot }
  '<'     { TokenLessThan }
  '('     { TokenLParen }
  '['     { TokenLBracket }
  ')'     { TokenRParen }
  ']'     { TokenRBracket }
  '{'     { TokenLCurlyBracket }
  '}'     { TokenRCurlyBracket }
  var     { TokenVar $$}
  int     { TokenInt $$}
  string  { TokenString $$ }

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
-----------------------------------------------------------------------------
Prog : MainMethod { Prog $1 [] }
     | MainMethod FuncDecs { Prog $1 $2 }

MainMethod : main unitType Block { MainMethod $3 } 

FuncDecs :: { [FuncDec] }
FuncDecs : ord_list(FuncDec) { $1 } 

Expr : Stream { IntStream $1 }
     | ArithExpr { Arith $1 }
     | BoolExpr  { Boolean $1 }
     | string { StringExpr $1 }
     | var { Variable $1 }
     | Type var { VarDec $1 $2 }
     | var '=' Expr { VarAssign $1 $3 }
     | Type var '=' Expr { VarDecAssign $1 $2 $4 }
     | FuncApp { FuncAppT $1 }
     | '(' Expr ')' { Bracket $2 }
     | var '[' Expr ']' '[' Expr ']' '=' Expr { IntStreamAssign $1 $3 $6 $9 }

Statement : Expr ';' { ExprStatement $1 }
          | if Expr Block else Block { IfElse $2 $3 $5 }
          | loop '(' Expr ':' Expr ':' IncOrDec ')' Block { ForLoop $3 $5 $7 $9 }
          | return Expr ';' { Return $2 }

FuncApp : print '(' Expr ')' { PrintFunc $3 }
        | var unitType { FuncApp $1 [] } 
        | var '(' ArgsList ')' { FuncApp $1 $3 }

FuncParamList :: { [(Type,String)] }
FuncParamList : unitType { [] } | '(' ParamList ')' { $2 }

FuncDec : Type var FuncParamList Block { FuncDec $2 $1 $3 $4 }

-------------------------------------------------------------
argsListRev :: { [Expr] }
argsListRev : Expr { [$1] } | argsListRev ',' Expr { $3 : $1 }

ArgsList :: { [Expr] }
ArgsList : rev(argsListRev) { $1 } 

paramListRev :: { [(Type,String)] }
paramListRev : Type var { [($1,$2)] } | ParamList ',' Type var { ($3,$4) : $1 } 

ParamList :: { [(Type,String)] }
ParamList : rev(paramListRev) { $1 } 
-------------------------------------------------------------
Block :: { [Statement] }
Block : '{' ord_list(Statement) '}' { $2 }

IntStreamRow :: { [Int] }
IntStreamRow : ord_list(int) { $1 }

Stream :: { [[Int]] }
Stream : eol { [[]] }
       | IntStreamRow eol { $1 : [[]] }
       | Stream eol { $1 ++ [[]] } 
       | Stream IntStreamRow eol { $1 ++ [$2] }

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
         | Expr '!'  Expr { Not $1 $3 }

Type : integerType { IntegerType } 
     | boolType { BooleanType }
     | stringType { StringType }
     | intStreamType { StreamType }
     | unitType { UnitType }
     | Type '->' Type { FunctionType $1 $3 }

IncOrDec : '+' int { Increment $2 }  | '-' int { Decrement $2 }

{
parseError :: [Token] -> a
parseError xs = error $ "Parse error on : " ++ (show xs)

parseString :: String -> Prog
parseString = parseCalc . alexScanTokens

data Prog = Prog MainMethod [FuncDec] deriving (Eq,Show)

data MainMethod = MainMethod [Statement] deriving (Eq,Show)

data Expr 
     = IntStream [[Int]]
     | Arith ArithExpr
     | Boolean BoolExpr
     | StringExpr String
     | Variable String
     | VarDec Type String
     | VarAssign String Expr
     | VarDecAssign Type String Expr
     | FuncAppT FuncApp
     | PrintExpr Expr 
     | Bracket Expr
     | IntStreamAssign String Expr Expr Expr -- variable_name, row_index, col_index, value
     deriving (Eq,Show)

data Statement
     = ExprStatement Expr
     | IfElse Expr [Statement] [Statement]
     | ForLoop Expr Expr IncOrDec [Statement]
     | Return Expr 
     deriving (Eq,Show)

data Block = Block [Statement] deriving (Eq,Show) -- List of one or more statements enclosed in curly braces

data Stream = Stream [[Int]] deriving (Eq,Show)

data IntStreamRow = IntStreamRow [Int] deriving (Eq,Show)

data FuncDec 
     = FuncDec String Type [(Type,String)] [Statement] --Name OutputType ParamsList Block 
     deriving (Eq,Show)

data ParamList = ParamList [(Type,String)] deriving (Eq,Show)
data FuncParamList = FuncParamList [(Type,String)] deriving (Eq,Show)

data FuncApp 
     = FuncApp String [Expr] -- Function name & ordered list of arguments 
     | PrintFunc Expr 
     deriving (Eq,Show)

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
     | Not Expr Expr 
     deriving (Eq,Show)
    
data Type 
     = IntegerType 
     | BooleanType 
     | StringType 
     | StreamType 
     | UnitType
     | FunctionType Type Type
     deriving (Eq,Show)

data IncOrDec = Increment Int | Decrement Int deriving (Eq,Show)
}