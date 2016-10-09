module Data.JoinFiles (joinFiles) where
import Data.List

joinFiles :: [String] -> String
joinFiles [] = ""
joinFiles xs =  intercalate "\n" xs
