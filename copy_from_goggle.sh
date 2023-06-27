#!/bin/bash

# Define the source directory. Please adjust this to match your SD card mount point
SRC_DIR="/Volumes/Goggle/DCIM/100MEDIA"

# Define the target base directory. This is where your dated folders will be created.
# TARGET_BASE_DIR="/path/to/your/destination/folder"
echo "Please enter the target base directory:"
read TARGET_BASE_DIR
# TARGET_BASE_DIR="$(pwd)"

echo "Moving files from ${SRC_DIR} to ${TARGET_BASE_DIR}..."
# Get today's date in "YYYY-MM-DD" format
TODAY=$(date '+%Y-%m-%d')

# Create the target directory path
TARGET_DIR="${TARGET_BASE_DIR}/${TODAY}"

# Create the target directory
mkdir -p "${TARGET_DIR}"

# Move the contents
mv "${SRC_DIR}"/* "${TARGET_DIR}"

echo "Move operation completed."
