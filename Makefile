CC = gcc
CFLAGS = -Wall -Wextra -Werror -std=c11

opdump: main.o dump.o 
	$(CC) $(CFLAGS) main.o dump.o -o opdump

main.o: main.c dump.h 
	$(CC) $(CFLAGS) -c main.c -o main.o

dump.o: dump.c dump.h
	$(CC) $(CFLAGS) -c dump.c -o dump.o

test: opdump
	./test.sh

clean:
	rm -f *.o opdump hacksdump
