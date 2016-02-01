module Main where

import Web.Blog

import System.Environment

main :: IO ()
main = do
    cfg <- parseConfig "blog.cfg"
    runBlog cfg
