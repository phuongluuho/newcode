#!/bin/bash

# Fake CPU consumption
echo "Simulating CPU consumption..."
# Start a background process that will consume CPU using the `stress` command
# If `stress` is not installed, use: sudo dnf install stress
stress --cpu 2 --timeout 600 &

# Fake memory consumption
#!/binPU consumption
[ec2-user@ip-172-31-24-40 system-stress]$ cat simulate_stress.sh 
#!/bin/bash

# Fake CPU consumption
echo "Simulating CPU consumption..."
# Start a background process that will consume CPU using the `stress` command
# If `stress` is not installed, use: sudo dnf install stress
stress --cpu 2 --timeout 600 &

# Fake memory consumption
echo "Simulating memory consumption..."
# Start a background process to consume memory
# Allocate 2GB of memory for simulation
stress --vm 2 --vm-bytes 2G --timeout 600 &

# Fake disk usage
echo "Simulating disk consumption..."
# Create a directory to store large files
mkdir -p /tmp/fake-disk
# Create 1GB of random data in a file (repeat to increase disk usage)
for i in {1..10}; do
    dd if=/dev/urandom of=/tmp/fake-disk/fakefile$i bs=1M count=100 oflag=sync
done

# Simulate system activity to show in `logwatch` and `journalctl`
echo "Simulating system activity for logwatch and journalctl..."
# Generate random system logs by simulating some activity
for i in {1..5}; do
    logger "Fake log entry #$i"
    sleep 1
done

echo "Simulation is running. You can now check htop, logwatch, and Cockpit to observe the resource consumption."

# Instructions to user
echo -e "\nYou can now use the following commands to observe the effects of the simulation:"
echo "1. Run 'htop' to observe CPU and memory usage."
echo "2. Use 'logwatch' to see the generated log entries."
echo "3. Open Cockpit in your browser to observe system health at: https://<your-server-ip>:9090"clear