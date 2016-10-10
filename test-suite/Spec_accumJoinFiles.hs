module Spec_accumJoinFiles (test_accumJoinFiles) where
import Data.AccumJoinFiles
import Test.Tasty.Hspec

test_accumJoinFiles :: Spec
test_accumJoinFiles = parallel $ do
    it "accumJoinFiles [] should return \"\"" $ do
        (accumJoinFiles []) `shouldBe` ""

    it "accumJoinFiles [\"0.1 1\",\"0.1 2\"] should return \"0.1 1.0\\n0.2 2.0\"" $ do
        (accumJoinFiles ["0.1 1","0.1 2"]) `shouldBe` "0.1 1.0\n0.2 2.0"

    it "accumJoinFiles [\"0.1 1\\n0.2 2\",\"0.1 2\"] should return \"0.1 1.0\\n0.2 2.0\\n0.3 2.0\"" $ do
        (accumJoinFiles ["0.1 1\n0.2 2","0.1 2"]) `shouldBe` "0.1 1.0\n0.2 2.0\n0.3 2.0"

    it "accumJoinFiles [\"0.1 1\\n0.2 2\",\"0.1 3\",\"0.1 4\"] should return \"0.1 1.0\\n0.2 2.0\\n0.3 3.0\\n0.4 4.0\"" $ do
        (accumJoinFiles ["0.1 1\n0.2 2","0.1 3", "0.1 4"]) `shouldBe` "0.1 1.0\n0.2 2.0\n0.3 3.0\n0.4 4.0"
