#!/bin/bash
PROJECT_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." >/dev/null 2>&1 && pwd)
gcc -Wall -O2 -Wextra -Wno-unused-parameter -Werror -pedantic -fsanitize=address "$PROJECT_ROOT/tsh.c" -o "$PROJECT_ROOT/tsh"
"$PROJECT_ROOT/tsh"
