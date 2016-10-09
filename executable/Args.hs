module Args (CmdOptions(..), cmdOptions) where
import Options.Applicative

data CmdOptions = CmdOptions
    { o :: String
    , i :: [String]
    , accum :: Bool }

cmdOptions :: Parser CmdOptions
cmdOptions = CmdOptions
    <$> strOption