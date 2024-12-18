#!/bin/bash

# Check if exactly two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <lower_threshold> <upper_threshold>"
    exit 1
fi

# Assign input arguments to variables
lower_threshold=$1
upper_threshold=$2

# Execute the command with the provided thresholds
echo "$lower_threshold $upper_threshold" | sudo tee /sys/devices/platform/huawei-wmi/charge_control_thresholds

# Confirm that the thresholds have been set
echo "Charge thresholds set to: $lower_threshold (lower) and $upper_threshold (upper)"

