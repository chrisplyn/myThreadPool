CFLAGS = -D_REENTRANT -Wall -pedantic -Isrc -g
LDLIBS = -lpthread
CC     = gcc
ASAN_FLAGS = -fsanitize=address -fno-omit-frame-pointer
ASAN_LIBS = -static-libasan


all: shutdown

shutdown: shutdown.o steque.o  threadpool.o
	$(CC) ${CFLAGS} -o $@ $^ ${LDLIBS} $(ASAN_FLAGS) $(ASAN_LIBS)

%.o : %.c
	$(CC) -c -o $@ $(CFLAGS) $<

clean:
	rm -f *.o shutdown



