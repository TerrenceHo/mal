import System.Console.Haskeline
-- import System.IO
-- import System.Environment
-- import Control.Exception (AsyncException(..))

mySettings :: Settings IO
mySettings = defaultSettings {historyFile = Just ".mal_history"}

mal_read :: a -> a
mal_read x = x

mal_eval :: a -> a
mal_eval x = x

mal_print :: a -> a
mal_print x = x

rep :: a -> a
rep = mal_print . mal_eval . mal_read

main :: IO ()
main = do
        runInputT mySettings $ withInterrupt $ loop getInputLine
    where
        loop :: (String -> InputT IO (Maybe String)) -> InputT IO ()
        loop inputFunc = do
            minput <-  handleInterrupt (return (Just "Caught interrupted"))
                        $ inputFunc "user> "
            case minput of
                Nothing -> return ()
                Just s -> do outputStrLn (rep s) 
                             loop inputFunc 
