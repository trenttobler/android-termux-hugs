# Haskell interpreter for Android (android-termux-hugs)

This code is an adaption of https://github.com/conscell/hugs-android (hugs haskell interpreter) so it can be built and run using the android termux app.

Tested on termux, version 0.60: https://play.google.com/store/apps/details?id=com.termux&hl=en

## Building

### Install Prerequisites

1. Install termux app from Google Play
1. Launch termux application.
1. Using command line, install required prerequisite packages:
```
$ pkg add git
$ pkg add make
$ pkg add proot
$ pkg add clang
```

### Compile Source and Install
```
$ termux-chroot
$ mkdir src
$ cd src
$ git clone https://github.com/trenttobler/android-termux-hugs.git
$ cd android-termux-hugs
$ make install
```

### Test the Interpreter
```
$ export PATH=$PATH:/usr/local/bin
$ cd
$ cd src
$ mkdir hs
$ cd hs
$ echo 'main = putStrLn “hug me!”’ > hi.hs
$ hugs
Hugs> :load hi
Main> main
Main> :q
$ echo '#!/usr/local/bin/runhugs' > hi
$ echo 'main = putStrLn "hug me!"' >> hi
$ chmod +x hi
$ ./hi
```
