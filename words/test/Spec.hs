import Test.Hspec
import Lib
import Data

main :: IO ()
main = hspec $ do
    describe "formatGrid" $ do
        it "Should concatenate every line with a newline" $ do
            (formatGrid ["abc", "def", "ghi"]) `shouldBe` "abc\ndef\nghi\n"

    describe "findWord" $ do
        it "Should find words that exist on the grid" $ do
            findWord grid "HASKELL" `shouldBe` Just "HASKELL"
            findWord grid "PERL" `shouldBe` Just "PERL"
        it "Should not find words that do not exist on the grid" $ do
            findWord grid "HAMSTER" `shouldBe` Nothing

    describe "findWords" $ do
        it "Should return a list of all found words" $ do
            findWords grid languages `shouldBe` languages
        it "Should not return words that were not found" $ do
            findWords grid ("HAMPSTER" : languages) `shouldBe` languages