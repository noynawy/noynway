#!/bin/bash

# Check if a file path is provided
if [ $# -eq 0 ]; then
    echo "No arguments supplied. Please provide a path to a CSV file."
    exit 1
fi

# Read the CSV file line by line
while IFS= read -r line
do
    # Run the Python script with the line as arguments
    python3 script.py $line
done < "$1"
