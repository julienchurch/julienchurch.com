module Paths_julienchurch (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,4,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/var/www/julienchurch.com/.stack-work/install/x86_64-linux/lts-3.0/7.10.2/bin"
libdir     = "/var/www/julienchurch.com/.stack-work/install/x86_64-linux/lts-3.0/7.10.2/lib/x86_64-linux-ghc-7.10.2/julienchurch-0.4.0.0-FMioEzLaUoY7MiI01RCR3r"
datadir    = "/var/www/julienchurch.com/.stack-work/install/x86_64-linux/lts-3.0/7.10.2/share/x86_64-linux-ghc-7.10.2/julienchurch-0.4.0.0"
libexecdir = "/var/www/julienchurch.com/.stack-work/install/x86_64-linux/lts-3.0/7.10.2/libexec"
sysconfdir = "/var/www/julienchurch.com/.stack-work/install/x86_64-linux/lts-3.0/7.10.2/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "julienchurch_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "julienchurch_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "julienchurch_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "julienchurch_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "julienchurch_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
