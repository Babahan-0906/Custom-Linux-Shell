# Tiny Unix Shell (Custom Shell in C)

This project is a simple Unix shell implemented in C.  
It was built to practice how Unix shells manage processes, jobs, and signals.

The shell supports basic job control and signal handling.

## Build and Run

### Prerequisites
- Linux/Unix Environment
- GCC
- Make

### Compilation
```bash
make build
```

### Running the Shell
```bash
./tsh
```

## Testing

Run the all tests:
```bash
make grade
```

Or run individual trace tests:
```bash
make test05
```

## Project Structure

- `tsh.c`: main shell implementation
- `tests/`: test trace files
  - `driver/`: grading harness (provided)
- `tools/`: user utilities
  - `run.sh`: quick script to compile and run
  - `zombie.sh`: helps identify zombie processes


## Compatibility Note

The reference shell (`tshref`) included with the tests was built using an older AddressSanitizer library (`libasan.so.4`).
On my system, a newer version (`libasan.so.8`) is installed, so tshref does not run by default.

To handle this, I included a small compatibility workaround in `tests/driver/libs/`.
The Makefile sets `LD_LIBRARY_PATH` so that tshref uses this local library.
If your system uses a different AddressSanitizer version, you may need to update this path accordingly.

## Credits

The test files and trace patterns were provided by the CS:APP, to validate and ensure the correctness of my shell. The core shell implementation is my own work.