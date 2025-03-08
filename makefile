# use @<command> to supress make echoing command
CC = gcc
CFLAGS = -Wall -Werror
OUT_FILE = derp

default: all

all: build install

test: build run

build: src/main.c
	@if [ ! -d bin ]; then mkdir bin; fi
	$(CC) src/main.c $(CFLAGS) -o bin/$(OUT_FILE)

install: bin/$(OUT_FILE)
	cp bin/$(OUT_FILE) $$HOME/../usr/bin

uninstall: bin/$(OUT_FILE)
	rm -f $$HOME/../usr/bin/$(OUT_FILE)

run:
	./bin/$(OUT_FILE) -i test c
	./bin/$(OUT_FILE) test

clean veryclean:
	rm -f bin/$(OUT_FILE)
