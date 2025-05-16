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
	@echo -e '\e[94mTest #1 no args\e[m'
	./bin/$(OUT_FILE)
	@echo -e '\e[94mTest #2 search 1 arg\e[m'
	./bin/$(OUT_FILE) test
	@echo -e '\e[94mTest #3 init 3 args\e[m'
	./bin/$(OUT_FILE) -i test c

clean veryclean:
	rm -f bin/$(OUT_FILE)
