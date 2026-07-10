#!/bin/bash

# BASH SIGNALS - Basic Signal Handling with trap
# Educational script demonstrating how to catch and handle Unix signals
# 
# Key Concepts:
# - Signals are notifications sent to processes by the operating system
# - trap: built-in bash command that specifies actions to take when signals are received
# - Common signals: SIGTERM (terminate), SIGINT (interrupt), SIGHUP (hangup)

# Define a cleanup function - this will be called when a signal is caught
cleanup() {
    echo ""
    echo "=== SIGNAL CAUGHT ==="
    echo "Cleanup function executed!"
    echo "Performing graceful shutdown..."
    # Add cleanup code here (close files, stop services, etc.)
    exit 0
}

# Register the cleanup function to handle SIGTERM and SIGINT signals
# SIGTERM: sent when you run 'kill <pid>'
# SIGINT: sent when you press Ctrl+C
trap cleanup SIGTERM SIGINT

# Main loop - demonstrates the script's behavior while waiting
echo "Script started (PID: $$)"
echo "Press Ctrl+C to test signal handling, or send: kill $$"
echo "Waiting for signals..."

# Infinite loop to keep the script running and responsive to signals
counter=0
while true; do
    sleep 1
    counter=$((counter + 1))
    echo "Still running... (${counter} seconds elapsed)"
done
