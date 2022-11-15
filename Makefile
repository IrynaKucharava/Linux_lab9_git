#Install
INST_DIR = /home/user/dir1/dir2

#Architecture
ARCH=arm64
CROSS_COMPILE=aarch64-linux

all: hello
hello: list.o matrix.o main.o
	$(CROSS_COMPILE)gcc list.o matrix.o main.o -lm -o app	
list.o: list.c
	$(CROSS_COMPILE)gcc -c -lm list.c -o list.o
matrix.o: matrix.c
	$(CROSS_COMPILE)gcc -c -lm matrix.c -o matrix.o
main.o: main.c
	$(CROSS_COMPILE)gcc -c -lm main.c -o main.o
install: 
	cp app $(INST_DIR);
	
static: list.c matrix.c
	$(CROSS_COMPILE)gcc -fpic -c list.c matrix.c
	ar -r static.a list.o matrix.o

dynamic: list.c matrix.c
	$(CROSS_COMPILE)gcc -fpic -c list.c matrix.c
	$(CROSS_COMPILE)gcc -shared list.o matrix.o -o dynamic.so	
.PHONY: clean
clean:
	rm -f list.o matrix.o main.o

