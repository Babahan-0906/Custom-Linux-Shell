# Unix Shell with Job Control (C)

This project implements a Unix-like shell in C with full job control support.
The shell correctly manages foreground and background execution, process groups,
and POSIX signal handling, with an emphasis on race-condition safety and robust
process lifecycle management.

The implementation focuses on correctness under concurrency, proper signal
forwarding semantics, and reliable cleanup of child processes.

---

## Overview

The shell parses and executes user commands in an interactive loop. Built-in
commands are handled directly by the shell, while external commands are executed
in child processes created via `fork` and `exec`.

Each command execution is modeled as a *job*, tracked internally with a job ID
(JID), process ID (PID), and execution state. The shell enforces correct Unix job
control semantics by using process groups and explicit signal management.

---

## Supported Features

- Foreground and background job execution
- Built-in job control commands: `jobs`, `bg`, `fg`, `quit`
- Internal job IDs (`%jid`) and PID-based job referencing
- Proper forwarding of terminal signals to foreground jobs
- Automatic reaping of terminated and stopped child processes
- Zombie-free child lifecycle management

---

## Architecture & Design

### Process and Job Management

- Each job is assigned its own process group to isolate signal delivery
- Foreground jobs exclusively receive terminal-generated signals
- Child processes call `setpgid` to establish correct process group ownership
- The shell maintains a synchronized job list tracking job state transitions

### Signal Handling

The shell installs explicit handlers for:
- `SIGCHLD` — to reap terminated or stopped children
- `SIGINT`  — forwarded to the foreground process group
- `SIGTSTP` — forwarded to the foreground process group

Signal handlers are kept minimal and async-signal-safe, delegating state updates
to controlled code paths.

### Race Condition Prevention

A key challenge was avoiding races between `fork`, job registration, and
`SIGCHLD` delivery.

This is addressed by:
- Blocking `SIGCHLD` during critical sections
- Registering jobs atomically before unblocking signals
- Ensuring that child termination cannot occur before job metadata is recorded

This design prevents lost wakeups, double reaping, and inconsistent job states.

---

## Key Implementation Challenges

- Correctly synchronizing `fork`, `addjob`, and `waitpid` under asynchronous
  signal delivery
- Forwarding signals to entire process groups instead of individual processes
- Separating responsibilities between the `SIGCHLD` handler and foreground wait
  logic to avoid double-reaping
- Ensuring the shell itself never receives terminal signals intended for jobs

---

## Testing & Validation

The shell was validated using a trace-driven test suite that simulates user
commands, concurrent jobs, and signal delivery.

Output behavior was verified against a reference implementation, with expected
differences only in dynamically assigned process IDs.

---

## Tech Stack

- **Language:** C
- **Environment:** Linux (POSIX)
- **Core APIs:** `fork`, `execve`, `waitpid`, `setpgid`, `kill`,
  `sigaction`, `sigprocmask`
- **Tooling:** GCC, GDB, Make

---

## Notes

This project emphasizes low-level correctness, concurrency safety, and precise
control over process behavior
