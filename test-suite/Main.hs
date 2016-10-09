import qualified Test.Tasty
import Test.Tasty.Hspec
import Spec_accumJoinFiles

main :: IO ()
main = do
    test <- testSpec "joinFiles" test_accumJoinFiles
    Test.Tasty.defaultMain test
