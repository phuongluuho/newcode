#!/bin/bash

# Script to simulate system load for monitoring/logging testing on CentOS 9

# Check if stress is installed
if ! command -v stress &> /dev/null; then
    echo "stress' is not installed. Please install it with: sudo dnf install -y stress"
    exit 1
fi

# Log start of simulation
logger "=== Starting system stress simulation ==="

# Simulate CPU load
echo "Simulating CPU load..."
stress --cpu 2 --timeout 600 &

# Simulate memory usage
echo "Simulating memory usage (2GB)..."
stress --vm 2 --vm-bytes 2G --timeout 600 &

# Simulate disk usage
echo "Simulating disk usage..."
mkdir -p /tmp/fake-disk
for i in {1..10}; do
    dd if=/dev/urandom of=/tmp/fake-disk/fakefile$i bs=1M count=100 oflag=sync status=none
done

# Generate fake system log entries
echo "Generating fake log entries (5 entries)..."
for i in {1..5}; do
    logger "Fake log entry #$i from simulate_stress.sh"
    sleep 1
done

# Log end of simulation
logger "=== Completed system stress simulation ==="

# Instructions to the user
echo -e "\n Simulation completed. You can now:"
echo "1. Run 'htop' or 'top' to observe CPU and memory usage."
echo "2. Use 'df -h' and 'du -sh /tmp/fake-disk' to check disk usage."
echo "3. Check logs with 'journalctl -b' or 'journalctl -u sshd'."
echo "4. Open Cockpit in your browser at: https://<your-server-ip>:9090"

exit 0
