{
module MPTokens where 
}

%wrapper "posn"
$digit = 0-9
$alpha = [a-zA-Z]
$space = [\ \t\f\v]

tokens :-
  \r\n           { \p _ -> TokenEOL p }
  \r             ;
  \n             ;
  $space+        ; 
  \-\>           { \p _ -> TokenArrow p }
  \(\)           { \p _ -> TokenUnitType p }
  integer        { \p _ -> TokenIntegerType p }
  intStream      { \p _ -> TokenIntStreamType p }
  string         { \p _ -> TokenStringType p }
  bool           { \p _ -> TokenBoolType p  }
  true           { \p _ -> TokenBool p True }
  false          { \p _ -> TokenBool p False }
  loop           { \p _ -> TokenLoop p }
  if             { \p _ -> TokenIf p }
  else           { \p _ -> TokenElse p }
  print          { \p _ -> TokenPrint p }
  return         { \p _ -> TokenReturn p }
  main           { \p _ -> TokenMainFun p }
  \"             { \p _ -> TokenQuote p }
  \;             { \p _ -> TokenSemiColon p }
  \:             { \p _ -> TokenColon p }
  \,             { \p _ -> TokenComma p }
  \=             { \p _ -> TokenEq p }
  \=\=           { \p _ -> TokenBEq p }
  \|\|           { \p _ -> TokenOr p }
  \&\&           { \p _ -> TokenAnd p }
  \+             { \p _ -> TokenAdd p }
  \-             { \p _ -> TokenSub p }
  \*             { \p _ -> TokenMul p }
  \/             { \p _ -> TokenDiv p }
  \%             { \p _ -> TokenMod p }
  \<             { \p _ -> TokenLessThan p }
  \!             { \p _ -> TokenNot p } 
  \(             { \p _ -> TokenLParen p }
  \[             { \p _ -> TokenLBracket p }
  \)             { \p _ -> TokenRParen p }
  \]             { \p _ -> TokenRBracket p }
  \{             { \p _ -> TokenLCurlyBracket p }
  \}             { \p _ -> TokenRCurlyBracket p }
  \"$printable*\" { \p xs -> TokenString p  [ x | x<-xs, not $ x == '\"'] }
  [a-z]+$alpha*  { \p s -> TokenVar p s }
  $digit+        { \p s -> TokenInt p (read s) }

{
data Token = 
  TokenEOL AlexPosn            |
  TokenArrow AlexPosn          | 
  TokenUnitType AlexPosn       |
  TokenIntegerType AlexPosn    |
  TokenIntStreamType AlexPosn  |
  TokenStringType AlexPosn     |
  TokenBoolType AlexPosn       |
  TokenBool AlexPosn Bool      |
  TokenLoop AlexPosn           |
  TokenIf AlexPosn             |  
  TokenElse AlexPosn           |
  TokenPrint AlexPosn          |
  TokenReturn AlexPosn         |
  TokenMainFun AlexPosn        |
  TokenQuote AlexPosn          |
  TokenSemiColon AlexPosn      |
  TokenColon AlexPosn          |
  TokenComma AlexPosn          |
  TokenEq AlexPosn             |
  TokenBEq AlexPosn            |
  TokenAdd AlexPosn            |
  TokenOr AlexPosn             |
  TokenAnd AlexPosn            |
  TokenSub AlexPosn            |
  TokenMul AlexPosn            |
  TokenDiv AlexPosn            |
  TokenMod AlexPosn            |
  TokenLessThan AlexPosn       |
  TokenNot AlexPosn            |
  TokenLParen AlexPosn         |
  TokenLBracket AlexPosn       |
  TokenRParen AlexPosn         |
  TokenRBracket AlexPosn       |
  TokenLCurlyBracket AlexPosn  |
  TokenRCurlyBracket AlexPosn  | 
  TokenVar AlexPosn String     |
  TokenString AlexPosn String  |
  TokenInt AlexPosn Int
  deriving Eq

tokenPosn :: Token -> String
tokenPosn (TokenEOL p) = show $ lineColPairFromPosn p
tokenPosn (TokenArrow p) = show $ lineColPairFromPosn p
tokenPosn (TokenUnitType p) = show $ lineColPairFromPosn p
tokenPosn (TokenIntegerType p) = show $ lineColPairFromPosn p
tokenPosn (TokenIntStreamType p) = show $ lineColPairFromPosn p 
tokenPosn (TokenStringType p) = show $ lineColPairFromPosn p
tokenPosn (TokenBoolType p) = show $ lineColPairFromPosn p
tokenPosn (TokenBool p b) = show $ lineColPairFromPosn p
tokenPosn (TokenLoop p) = show $ lineColPairFromPosn p
tokenPosn (TokenIf p) = show $ lineColPairFromPosn p
tokenPosn (TokenElse p) = show $ lineColPairFromPosn p
tokenPosn (TokenPrint p) = show $ lineColPairFromPosn p
tokenPosn (TokenReturn p) = show $ lineColPairFromPosn p
tokenPosn (TokenMainFun p) = show $ lineColPairFromPosn p
tokenPosn (TokenQuote p) = show $ lineColPairFromPosn p
tokenPosn (TokenSemiColon p) = show $ lineColPairFromPosn p
tokenPosn (TokenColon p) = show $ lineColPairFromPosn p
tokenPosn (TokenComma p) = show $ lineColPairFromPosn p
tokenPosn (TokenEq p) = show $ lineColPairFromPosn p
tokenPosn (TokenBEq p) = show $ lineColPairFromPosn p
tokenPosn (TokenAdd p) = show $ lineColPairFromPosn p
tokenPosn (TokenOr p) = show $ lineColPairFromPosn p
tokenPosn (TokenAnd p) = show $ lineColPairFromPosn p
tokenPosn (TokenSub p) = show $ lineColPairFromPosn p
tokenPosn (TokenMul p) = show $ lineColPairFromPosn p
tokenPosn (TokenDiv p) = show $ lineColPairFromPosn p
tokenPosn (TokenMod p) = show $ lineColPairFromPosn p
tokenPosn (TokenLessThan p) = show $ lineColPairFromPosn p
tokenPosn (TokenNot p) = show $ lineColPairFromPosn p
tokenPosn (TokenLParen p) = show $ lineColPairFromPosn p
tokenPosn (TokenLBracket p) = show $ lineColPairFromPosn p
tokenPosn (TokenRParen p) = show $ lineColPairFromPosn p
tokenPosn (TokenRBracket p) = show $ lineColPairFromPosn p
tokenPosn (TokenLCurlyBracket p) = show $ lineColPairFromPosn p
tokenPosn (TokenRCurlyBracket p) = show $ lineColPairFromPosn p
tokenPosn (TokenVar p s ) = show $ lineColPairFromPosn p
tokenPosn (TokenString p s) = show $ lineColPairFromPosn p
tokenPosn (TokenInt p i) = show $ lineColPairFromPosn p

instance Show Token where
  show (TokenEOL p) = "EOL" ++ (show $ lineColPairFromPosn p)
  show (TokenArrow p ) = "->" ++ (show $ lineColPairFromPosn p)
  show (TokenUnitType p ) = "()" ++ (show $ lineColPairFromPosn p)
  show (TokenIntegerType p ) = "integer" ++ (show $ lineColPairFromPosn p)
  show (TokenIntStreamType p ) = "intStream" ++ (show $ lineColPairFromPosn p)
  show (TokenStringType p ) = "string" ++ (show $ lineColPairFromPosn p)
  show (TokenBoolType p ) = "bool" ++ (show $ lineColPairFromPosn p)
  show (TokenBool p b) = show b ++ (show $ lineColPairFromPosn p)
  show (TokenLoop p) = "loop" ++ (show $ lineColPairFromPosn p)
  show (TokenIf p) = "if" ++ (show $ lineColPairFromPosn p)
  show (TokenElse p) = "else" ++ (show $ lineColPairFromPosn p)        
  show (TokenPrint p) = "`print`" ++ (show $ lineColPairFromPosn p)
  show (TokenReturn p) = "return" ++ (show $ lineColPairFromPosn p)
  show (TokenMainFun p) = "main" ++ (show $ lineColPairFromPosn p)
  show (TokenQuote p) = "\"\"" ++ (show $ lineColPairFromPosn p)   
  show (TokenSemiColon p) = ";" ++ (show $ lineColPairFromPosn p)   
  show (TokenColon p) = "`:`" ++ (show $ lineColPairFromPosn p)      
  show (TokenComma p) = "`,`" ++ (show $ lineColPairFromPosn p)       
  show (TokenEq p) = "`=`"  ++ (show $ lineColPairFromPosn p)       
  show (TokenBEq p) = "`==`" ++ (show $ lineColPairFromPosn p)           
  show (TokenAdd p) = "`+`" ++ (show $ lineColPairFromPosn p)         
  show (TokenOr p) = "`||`" ++ (show $ lineColPairFromPosn p)              
  show (TokenAnd p) = "`&&`" ++ (show $ lineColPairFromPosn p)             
  show (TokenSub p) = "`-`" ++ (show $ lineColPairFromPosn p)           
  show (TokenMul p) = "`*`" ++ (show $ lineColPairFromPosn p)             
  show (TokenDiv p) = "`\\`" ++ (show $ lineColPairFromPosn p)             
  show (TokenMod p) = "`%`" ++ (show $ lineColPairFromPosn p)             
  show (TokenLessThan p) = "`>`" ++ (show $ lineColPairFromPosn p)     
  show (TokenNot p) = "`!`" ++ (show $ lineColPairFromPosn p)         
  show (TokenLParen p) = "`(`" ++ (show $ lineColPairFromPosn p) 
  show (TokenLBracket p) = "`[`" ++ (show $ lineColPairFromPosn p)   
  show (TokenRParen p) = "`)`" ++ (show $ lineColPairFromPosn p)  
  show (TokenRBracket p) = "`]`" ++ (show $ lineColPairFromPosn p)   
  show (TokenLCurlyBracket p) = "{" ++ (show $ lineColPairFromPosn p) 
  show (TokenRCurlyBracket p) = "}" ++ (show $ lineColPairFromPosn p)  
  show (TokenVar p s) = "Var :=" ++ s ++ " " ++ (show $ lineColPairFromPosn p)  
  show (TokenString p s) = "String :=" ++ s ++ " " ++ (show $ lineColPairFromPosn p) 
  show (TokenInt p i) = "Int :=" ++ show i ++ " " ++ (show $ lineColPairFromPosn p) 
  
lineColPairFromPosn :: AlexPosn -> (Int,Int)
lineColPairFromPosn (AlexPn _ l c) = (l,c)
  
alexScanTokens_ str = go (alexStartPos,'\n',[],str)
  where go inp@(pos,_,_,str) =
          case alexScan inp 0 of
           AlexEOF -> []
           AlexError (_,_,_,s) -> error $ "Lexical error at string " ++ show s ++ " at position : " ++ (show $ lineColPairFromPosn pos)
           AlexSkip inp' len -> go inp'
           AlexToken inp' len act -> act pos (take len str) : go inp'
}
 