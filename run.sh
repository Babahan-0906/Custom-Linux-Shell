#!/bin/bash
gcc -Wall -O2 -Wextra -Wno-unused-parameter -Werror -pedantic -fsanitize=address    tsh.c   -o tsh
./tsh
