#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 input_file output_file"
  exit 1
fi

input_file=$1
output_file=$2

# Check if the input file exists
if [ ! -e "$input_file" ]; then
  echo "Error: Input file '$input_file' not found."
  exit 1
fi

# Loop through each line in the input file, convert HTML to Pug, and write to the output file
while IFS= read -r line; do
  # Use sed to replace HTML syntax with Pug syntax
  pug_line=$(echo "$line" | sed 's/<div>/div/')
  
  # Append the converted line to the output file
  echo "$pug_line" >> "$output_file"
done < "$input_file"

echo "Conversion complete. Output written to $output_file"