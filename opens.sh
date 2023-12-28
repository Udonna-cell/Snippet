#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

filename=$1

while IFS= read -r line; do
    # Remove < in HTML tags and replace /> with ) followed by a space
    cleaned_line=$(echo "$line" | sed 's/<\([^>]*\)>/\1/g; s/\/>/) /g')
    echo "$cleaned_line" >> "jades.snippets"
done < "$filename"