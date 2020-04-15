import MPTokens
import MPGrammar
import System.Environment
import Control.Exception
import System.IO
import MPEval



main :: IO ()
main = catch main' noParse

main' = do (fileName: _) <- getArgs
           sourceText <- readFile (fileName)
           inputTextWhole <- getContents
           let inputTextLines = combineMultipleLists (remWhiteSpace (lines inputTextWhole)) []
           let tokens = alexScanTokens sourceText
           let parsedProg = parseCalc (alexScanTokens sourceText)
           --compiled <- evaluateProgram (parsedProg)
           return ()
        

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()