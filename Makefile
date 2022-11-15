#Install
INST_DIR = /home/user/dir1/dir2

all: hello
hello: list.o matrix.o main.o
	gcc list.o matrix.o main.o -lm -o app	
list.o: list.c
	gcc -c -lm list.c -o list.o
matrix.o: matrix.c
	gcc -c -lm matrix.c -o matrix.o
main.o: main.c
	gcc -c -lm main.c -o main.o
install: 
	cp app $(INST_DIR);
	
static: list.c matrix.c
	gcc -fpic -c list.c matrix.c
	ar -r static.a list.o matrix.o

dynamic: list.c matrix.c
	gcc -fpic -c list.c matrix.c
	gcc -shared list.o matrix.o -o dynamic.so	
clean:
	rm -f list.o matrix.o main.o

