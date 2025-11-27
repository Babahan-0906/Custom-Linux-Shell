#!/bin/bash
ps -A -ostat,ppid | grep -e '[zZ]'| awk '{ print $2 }'