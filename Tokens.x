{
module MPTokens where 
}

%wrapper "basic"
$digit = 0-9
$alpha = [a-zA-Z]
$space = [\ \t\f\v]


tokens :-
  \r\n           { \_ -> TokenEOL }
  \r             ;
  \n             ;
  $space+        ; 
  \-\>           { \_ -> TokenArrow }
  \(\)           { \_ -> TokenUnitType }
  integer        { \_ -> TokenIntType }
  intStream      { \_ -> TokenIntStreamType }
  string         { \_ -> TokenStringType }
  bool           { \_ -> TokenBoolVal  }
  true           { \_ -> TokenBool True }
  false          { \_ -> TokenBool False }
  loop           { \_ -> TokenLoop }
  if             { \_ -> TokenIf }
  else           { \_ -> TokenElse }
  print          { \_ -> TokenPrint }
  return         { \_ -> TokenReturn }
  main           { \_ -> TokenMain }
  \"             { \_ -> TokenQuote }
  \;             { \_ -> TokenSemiCol }
  \:             { \_ -> TokenColon }
  \,             { \_ -> TokenComma }
  \=             { \_ -> TokenEq }
  \=\=           { \_ -> TokenNotEq }
  \|\|           { \_ -> TokenOr  }
  \&\&           { \_ -> TokenAnd }
  \+             { \_ -> TokenAdd }
  \-             { \_ -> TokenSub }
  \*             { \_ -> TokenMul }
  \/             { \_ -> TokenDiv }
  \%             { \_ -> TokenMod }
  \<             { \_ -> TokenLess }
  \!             { \_ -> TokenNot } 
  \(             { \_ -> TokenLParen }
  \[             { \_ -> TokenLBracket }
  \)             { \_ -> TokenRParen }
  \]             { \_ -> TokenRBracket }
  \{             { \_ -> TokenLCurlyBracket }
  \}             { \_ -> TokenRCurlyBracket }
  \"$printable*\" { \xs -> TokenString $ [ x | x<-xs, not $ x == '\"'] }
  [a-z]+$alpha*  { \s -> TokenVar s }
  $digit+        { \s -> TokenInt (read s) }
{

data Token = 
  TokenEOL            |
  TokenArrow          | 
  TokenUnitType       | 
  TokenIntType    |
  TokenIntStreamType  |
  TokenStringType     |
  TokenBoolType       |
  TokenBool Bool      |
  TokenLoop           |
  TokenIf             |  
  TokenElse           |
  TokenPrint          |
  TokenReturn         |
  TokenMain        |
  TokenQuote          |
  TokenSemiCol      |
  TokenColon          |
  TokenComma          |
  TokenEq             |
  TokenNotEq            |
  TokenAdd            |
  TokenOr             |
  TokenAnd            |
  TokenSub            |
  TokenMul            |
  TokenDiv            |
  TokenMod            |
  TokenLess       |
  TokenNot            |
  TokenLParen         |
  TokenLBracket       |
  TokenRParen         |
  TokenRBracket       |
  TokenLCurlyBracket  |
  TokenRCurlyBracket  | 
  TokenVar String     |
  TokenString String  |
  TokenInt Int
  deriving Eq

instance Show Token where
  show (TokenEOL) = "EOL"
  show (TokenArrow) = "->"
  show (TokenUnitType) = "()"
  show (TokenIntType) = "integer"  
  show (TokenIntStreamType) = "intStream"
  show (TokenStringType) = "string"
  show (TokenBoolType) = "bool"   
  show (TokenBool b) = show b 
  show (TokenLoop) = "loop"      
  show (TokenIf) = "if"           
  show (TokenElse) = "else"        
  show (TokenPrint) = "`print`"
  show (TokenReturn) = "return"
  show (TokenMain) = "main"
  show (TokenQuote) = "\"\""       
  show (TokenSemiCol) = ";"     
  show (TokenColon) = "`:`"      
  show (TokenComma) = "`,`"        
  show (TokenEq) = "`=`"         
  show (TokenNotEq) = "`==`"           
  show (TokenAdd) = "`+`"           
  show (TokenOr) = "`||`"               
  show (TokenAnd) = "`&&`"              
  show (TokenSub) = "`-`"             
  show (TokenMul) = "`*`"               
  show (TokenDiv) = "`\\`"              
  show (TokenMod) = "`%`"              
  show (TokenLess) = "`>`"        
  show (TokenNot) = "`!`"             
  show (TokenLParen) = "`(`"   
  show (TokenLBracket) = "`[`"   
  show (TokenRParen) = "`)`"   
  show (TokenRBracket) = "`]`"   
  show (TokenLCurlyBracket) = "{"   
  show (TokenRCurlyBracket) = "}"   
  show (TokenVar s) = "Variable : " ++ s    
  show (TokenString s) = "String : " ++ s  
  show (TokenInt i) = "Int : " ++ show i  
}
 