module Paths_haskell98 (
	version,
	getBinDir, getLibDir, getDataDir, getLibexecDir,
	getDataFileName
	) where

import Data.Version

version = Version {versionBranch = [1,0], versionTags = []}

bindir     = "/data/data/jackpal.androidterm/app_HOME/hugs/bin"
libdir     = "/data/data/jackpal.androidterm/app_HOME/hugs/lib/hugs/packages/haskell98"
datadir    = "/data/data/jackpal.androidterm/app_HOME/hugs/share/haskell98-1.0"
libexecdir = "/data/data/jackpal.androidterm/app_HOME/hugs/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = return bindir
getLibDir = return libdir
getDataDir = return datadir
getLibexecDir = return libexecdir

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = return (datadir ++ "/" ++ name)
