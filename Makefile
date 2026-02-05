# Makefile for the CS:APP Shell Lab

DRIVER = ./tests/driver/sdriver.pl
TSH = ./tsh
TSHREF = ./tests/driver/tshref
TSHARGS = "-p"
CC = gcc
CFLAGS = -Wall -O2 -Wextra -Wno-unused-parameter -Werror -pedantic -fsanitize=address
FILES = $(TSH) ./myspin ./mysplit ./mystop ./myint

# Add local libs to path for tshref compatibility
export LD_LIBRARY_PATH := ./tests/driver/libs:$(LD_LIBRARY_PATH)

# C formatting related constants
TARGET = .*\.\(cpp\|hpp\|c\|h\)

all: grade.sh

grade: $(FILES)
	./tests/driver/grade.sh

build: $(FILES)

# Helper programs
myspin: tests/helpers/myspin.c
	$(CC) $(CFLAGS) $< -o $@

mysplit: tests/helpers/mysplit.c
	$(CC) $(CFLAGS) $< -o $@

mystop: tests/helpers/mystop.c
	$(CC) $(CFLAGS) $< -o $@

myint: tests/helpers/myint.c
	$(CC) $(CFLAGS) $< -o $@

tsh: tsh.c
	$(CC) $(CFLAGS) $< -o $@

##################
# Regression tests
##################

# Run tests using the student's shell program
test01:
	$(DRIVER) -t tests/trace01.txt -s $(TSH) -a $(TSHARGS)
test02:
	$(DRIVER) -t tests/trace02.txt -s $(TSH) -a $(TSHARGS)
test03:
	$(DRIVER) -t tests/trace03.txt -s $(TSH) -a $(TSHARGS)
test04:
	$(DRIVER) -t tests/trace04.txt -s $(TSH) -a $(TSHARGS)
test05:
	$(DRIVER) -t tests/trace05.txt -s $(TSH) -a $(TSHARGS)
test06:
	$(DRIVER) -t tests/trace06.txt -s $(TSH) -a $(TSHARGS)
test07:
	$(DRIVER) -t tests/trace07.txt -s $(TSH) -a $(TSHARGS)
test08:
	$(DRIVER) -t tests/trace08.txt -s $(TSH) -a $(TSHARGS)
test09:
	$(DRIVER) -t tests/trace09.txt -s $(TSH) -a $(TSHARGS)
test10:
	$(DRIVER) -t tests/trace10.txt -s $(TSH) -a $(TSHARGS)
test11:
	$(DRIVER) -t tests/trace11.txt -s $(TSH) -a $(TSHARGS)
test12:
	$(DRIVER) -t tests/trace12.txt -s $(TSH) -a $(TSHARGS)
test13:
	$(DRIVER) -t tests/trace13.txt -s $(TSH) -a $(TSHARGS)
test14:
	$(DRIVER) -t tests/trace14.txt -s $(TSH) -a $(TSHARGS)
test15:
	$(DRIVER) -t tests/trace15.txt -s $(TSH) -a $(TSHARGS)
test16:
	$(DRIVER) -t tests/trace16.txt -s $(TSH) -a $(TSHARGS)

# Run the tests using the reference shell program
rtest01:
	$(DRIVER) -t tests/trace01.txt -s $(TSHREF) -a $(TSHARGS)
rtest02:
	$(DRIVER) -t tests/trace02.txt -s $(TSHREF) -a $(TSHARGS)
rtest03:
	$(DRIVER) -t tests/trace03.txt -s $(TSHREF) -a $(TSHARGS)
rtest04:
	$(DRIVER) -t tests/trace04.txt -s $(TSHREF) -a $(TSHARGS)
rtest05:
	$(DRIVER) -t tests/trace05.txt -s $(TSHREF) -a $(TSHARGS)
rtest06:
	$(DRIVER) -t tests/trace06.txt -s $(TSHREF) -a $(TSHARGS)
rtest07:
	$(DRIVER) -t tests/trace07.txt -s $(TSHREF) -a $(TSHARGS)
rtest08:
	$(DRIVER) -t tests/trace08.txt -s $(TSHREF) -a $(TSHARGS)
rtest09:
	$(DRIVER) -t tests/trace09.txt -s $(TSHREF) -a $(TSHARGS)
rtest10:
	$(DRIVER) -t tests/trace10.txt -s $(TSHREF) -a $(TSHARGS)
rtest11:
	$(DRIVER) -t tests/trace11.txt -s $(TSHREF) -a $(TSHARGS)
rtest12:
	$(DRIVER) -t tests/trace12.txt -s $(TSHREF) -a $(TSHARGS)
rtest13:
	$(DRIVER) -t tests/trace13.txt -s $(TSHREF) -a $(TSHARGS)
rtest14:
	$(DRIVER) -t tests/trace14.txt -s $(TSHREF) -a $(TSHARGS)
rtest15:
	$(DRIVER) -t tests/trace15.txt -s $(TSHREF) -a $(TSHARGS)
rtest16:
	$(DRIVER) -t tests/trace16.txt -s $(TSHREF) -a $(TSHARGS)


# clean up
clean:
	rm -f $(FILES) *.o *~


