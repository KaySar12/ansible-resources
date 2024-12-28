#!/bin/bash

# Get the input and output directories from command-line arguments
input_directory="$1"
output_directory="$2"

# Check if both input and output directories are provided
if [ -z "$input_directory" ] || [ -z "$output_directory" ]; then
  echo "Usage: $0 input_directory output_directory"
  exit 1
fi

# Check if the input directory exists
if [ ! -d "$input_directory" ]; then
  echo "Error: Input directory '$input_directory' does not exist."
  exit 1
fi

# Check if the output directory exists, create it if it doesn't
if [ ! -d "$output_directory" ]; then
  mkdir -p "$output_directory"
  echo "Created output directory: $output_directory"
fi

# Function to recursively scan the directory and generate YAML output
generate_yaml() {
  local dir="$1"
  local parent_path="$2"

  # Calculate the relative path
  local base_name=$(basename "$dir")
  local full_path
  if [ -z "$parent_path" ]; then
    full_path="$base_name" # Top-level directory
  else
    full_path="$parent_path/$base_name"
  fi

  echo "- $full_path:"

  # Loop through the contents of the directory
  for item in "$dir"/*; do
    if [ -d "$item" ]; then
      # Recursively call the function for subdirectories
      generate_yaml "$item" "$full_path"
    elif [ -f "$item" ]; then
      local file_name=$(basename "$item")
      echo "- $full_path/$file_name"
    fi
  done
}

# Write the YAML header and key
echo "---" > "$output_directory/directory_structure.yml"
echo "directories:" >> "$output_directory/directory_structure.yml"

# Generate the YAML output under the `directory_structure` key
generate_yaml "$input_directory" "" >> "$output_directory/directory_structure.yml"

echo "Directory structure written to $output_directory/directory_structure.yml"
