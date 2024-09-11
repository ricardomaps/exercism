{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_collatz_conjecture (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,2,1,4] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/ricmaps_/exercism/haskell/collatz-conjecture/.stack-work/install/x86_64-linux/53a8996e278d536cfaf12caaf79396f45cc6a1e21adaa7544c504808aa043400/9.2.7/bin"
libdir     = "/home/ricmaps_/exercism/haskell/collatz-conjecture/.stack-work/install/x86_64-linux/53a8996e278d536cfaf12caaf79396f45cc6a1e21adaa7544c504808aa043400/9.2.7/lib/x86_64-linux-ghc-9.2.7/collatz-conjecture-1.2.1.4-1SiTXl6COMw1VzV1nJTyLD"
dynlibdir  = "/home/ricmaps_/exercism/haskell/collatz-conjecture/.stack-work/install/x86_64-linux/53a8996e278d536cfaf12caaf79396f45cc6a1e21adaa7544c504808aa043400/9.2.7/lib/x86_64-linux-ghc-9.2.7"
datadir    = "/home/ricmaps_/exercism/haskell/collatz-conjecture/.stack-work/install/x86_64-linux/53a8996e278d536cfaf12caaf79396f45cc6a1e21adaa7544c504808aa043400/9.2.7/share/x86_64-linux-ghc-9.2.7/collatz-conjecture-1.2.1.4"
libexecdir = "/home/ricmaps_/exercism/haskell/collatz-conjecture/.stack-work/install/x86_64-linux/53a8996e278d536cfaf12caaf79396f45cc6a1e21adaa7544c504808aa043400/9.2.7/libexec/x86_64-linux-ghc-9.2.7/collatz-conjecture-1.2.1.4"
sysconfdir = "/home/ricmaps_/exercism/haskell/collatz-conjecture/.stack-work/install/x86_64-linux/53a8996e278d536cfaf12caaf79396f45cc6a1e21adaa7544c504808aa043400/9.2.7/etc"

getBinDir     = catchIO (getEnv "collatz_conjecture_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "collatz_conjecture_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "collatz_conjecture_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "collatz_conjecture_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "collatz_conjecture_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "collatz_conjecture_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
