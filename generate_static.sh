#!/bin/bash

# Specify the output file path
output_file="examples/data/pathway-docs/machinespecs.jsonl"

# Run neofetch and store the output in a variable
neofetch_content=$(neofetch --json)

# Create a JSON string with the specified schema
json_output="{\"doc\": $neofetch_content}"

# Store the output in the specified JSON file
echo "$json_output" > "$output_file"

# Print the JSON details
echo "$json_output"
