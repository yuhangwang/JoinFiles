module Spec_joinFiles (test_joinFiles) where
import Data.JoinFiles
import Test.Tasty.Hspec

test_joinFiles :: Spec
test_joinFiles = parallel $ do
    it "joinFiles [] should return \"\"" $ do
        (joinFiles []) `shouldBe` ""

    it "joinFiles [\"a\",\"b\"] should return \"a\nb\"" $ do
        (joinFiles ["a","b"]) `shouldBe` "a\nb"
