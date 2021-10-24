module Main where

import Control.Monad
import Control.Concurrent
import Lib

import Text.Printf

--main :: IO ()
-- Правильно ли написал задачу?
-- Запустить процесс, считать его PID. При вводе exit завершать процесс
main = loop
    where
         loop = do
           s <- getLine
           printf "First string: %s\n" s
           if s == "exit"
              then return ()
              else do forkIO $ checkUserInput s
                      loop

checkUserInput :: String -> IO ()
checkUserInput s  = do
  let t = read s :: Int
  printf "user typed: %d\n" t
  --threadDelay (10^6 * t)
  --printf "%d seconds is up! BING!\BEL\n" t