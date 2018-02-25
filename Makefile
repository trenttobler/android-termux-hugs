# Makefile assumes:
# 	- clang has been installed
# 	- running in the context of termux-chroot

all :
	cd jni; make

install :
	mkdir -p /usr/local/bin
	mkdir -p /usr/local/lib
	cd jni; make install
	cd hugs; cp bin/* /usr/local/bin/.
	cd hugs; cp -r lib/. /usr/local/lib/.

clean :
	cd jni; make clean
