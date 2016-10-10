module Data.AccumJoinFiles (accumJoinFiles) where
import Data.List

accumJoinFiles :: [String] -> String
accumJoinFiles [] = ""
accumJoinFiles xs =  intercalate "\n" (map arrays2str new_data)
    where new_data = parseData xs

arrays2str :: [[Float]] -> String
arrays2str xs = intercalate "\n" (map array2str xs)

array2str :: [Float] -> String
array2str xs = intercalate " " (map show xs)

parseData :: [String] -> [[[Float]]]
parseData contents = aux 0 contents [] 
    where 
        aux :: Float -> [String] -> [[[Float]]] -> [[[Float]]]
        aux _ [] accum = reverse accum
        aux offset (x:xs) accum = aux new_offset xs (item:accum)
            where 
                item = parseLines offset x
                new_offset = head (last item)

parseLines :: Float -> String -> [[Float]]
parseLines offset body = map (parseLine offset) (lines body)

parseLine :: Float -> String -> [Float]
parseLine offset line = addOffset offset (map read (words line))

-- | Add an offset to the first item of an array of numbers
addOffset :: Float -> [Float] -> [Float]
addOffset _ [] = []
addOffset n (x:xs) = ((x + n):xs)

