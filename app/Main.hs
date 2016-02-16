module Main where

import Core 

import System.Environment

main :: IO ()
main = do
    cfg <- parseConfig "blog.cfg"
    runBlog cfg
