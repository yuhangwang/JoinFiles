import Data.JoinFiles
import System.Environment
import System.Exit

main :: IO ()
main = do
    args <- getArgs
    exe args

usage :: String
usage = "USAGE: JoinFiles output.dat i1.dat i2.dat ..."

exe :: [String] -> IO ()
exe [] = do 
    putStrLn usage
    exitFailure

exe [_] = do 
    putStrLn usage
    exitFailure

exe (output:inputs) = do
    dat <- loadData inputs
    writeFile output (joinFiles dat)


-- | Read files and store contents as array of big strings
-- note: to get stuff out from 'IO String'
-- one must use '<-' inside another IO function
-- Thus loadData must be an IO function.
loadData :: [String] -> IO [String]
loadData files = aux files []
    where
        aux :: [String] -> [String] -> IO [String]
        aux [] accum = return (reverse accum)
        aux (f:fs) accum = do
            content <- readFile f
            aux fs (content:accum)