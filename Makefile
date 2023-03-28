
all: build run

zip:
	zip naloga.zip Makefile main.c

# Preprocessing -> Include macros (#define), header files (declarations, constants: in #include), preprocessor directives(#ifndef, $include, #define: commands that are processed before being compiled).
preprocess:
	gcc -E main.c -o main.i

# Assembling -> Translate preprocessed code to assembly code; specific to the architecture aka is not universal; OS bits, Endianness, CPU architecture.
assemble:
	gcc -S main.i -o main.s

# Translation -> Translate assembly code to machine code, output object that contains machine code.
translate:
	gcc -c main.s -o main.o

# Linking -> Link object files to create executable, can be linked with libraries.
link:
	gcc main.o -o main

build: preprocess assemble translate link

run:
	./main
