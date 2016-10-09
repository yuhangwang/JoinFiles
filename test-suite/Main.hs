import qualified Test.Tasty
import Test.Tasty.Hspec
import Spec_joinFiles

main :: IO ()
main = do
    test <- testSpec "joinFiles" test_joinFiles
    Test.Tasty.defaultMain test
