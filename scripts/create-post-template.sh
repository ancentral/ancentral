#!/bin/bash

# Script to create multiple markdown files with a specific naming convention
# Usage: ./script_name.sh <number_of_files>
# Example: ./script_name.sh 5
# This will create 'number_of_files' markdown files named as:
# YYYY-MM-DD-YYYYMMDD-SomeText-FileNumber.md
# Each file will contain a front matter block with metadata including the current date and time.

# Check if the number of files to create is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <number_of_files>"
  exit 1
fi

# Number of files to create
num_files=$1

# Get today's date in required formats
date1=$(date +%Y-%m-%d)
date2=$(date +%Y%m%d)

# Get current date and time in required format for file content
datetime=$(date +"%Y-%m-%d %H:%M:%S %z")

# Base text in the filename
base_text="PostTitle"

# Change the directory to _posts to create files in the directory
cd ../_posts

# Create the files with the specified naming convention and write content
for (( i=1; i<=num_files; i++ ))
do
  filename="${date1}-${date2}-${base_text}-${i}.md"
  cat <<EOF > "$filename"
---
layout: post
title: "PostTitle"
description: "PostDescription"
date: $datetime
author: "AndhraCentral Desk"
image: 'PreviewImageLink'
tags: [politics]
featured: true
---
EOF
  echo "Created file: $filename"
done
