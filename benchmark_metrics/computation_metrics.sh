#!/bin/bash

# Set the command or script to run
command="your_command_here"

# Set the name of the log file to save the output
log_file="log.txt"

# Run the command and measure its runtime and maximum memory usage
/usr/bin/time -v $command 2>&1 | tee -a $log_file

# Print the maximum memory usage to the console
echo "Maximum memory usage:"
grep "Maximum resident set size" $log_file

# Print the runtime to the console
echo "Runtime:"
grep "Elapsed (wall clock) time" $log_file

