#!/bin/bash

# Usage: ./update-json.sh <file.json> <key> <value>

file="$1"
key="$2"
value="$3"

# Check if all arguments are provided
if [[ -z "$file" || -z "$key" || -z "$value" ]]; then
  echo "Usage: $0 <file.json> <key> <value>"
  exit 1
fi

# Check if the file exists and is a valid JSON file
if [[ ! -f "$file" ]]; then
  echo "Error: File '$file' does not exist."
  exit 1
fi

if ! jq empty "$file" &>/dev/null; then
  echo "Error: File '$file' is not a valid JSON file."
  exit 1
fi

# Create a temporary file for safe updates
temp_file=$(mktemp)

# Determine the type of the value
if [[ "$value" =~ ^\".*\"$ || "$value" =~ ^\'.*\'$ ]]; then
  # If value is enclosed in quotes, treat as a string
  value=$(echo "$value" | sed -e 's/^["'"'"']//;s/["'"'"']$//')
  jq --arg key "$key" --arg value "$value" '. + { ($key): $value }' "$file" > "$temp_file"
elif [[ "${value,,}" == "true" || "${value,,}" == "false" ]]; then
  # Boolean value (case-insensitive)
  jq --arg key "$key" --argjson value "${value,,}" '. + { ($key): $value }' "$file" > "$temp_file"
elif [[ "$value" =~ ^-?[0-9]+$ || "$value" =~ ^-?[0-9]+\.[0-9]+$ ]]; then
  # Numeric value
  jq --arg key "$key" --argjson value "$value" '. + { ($key): $value }' "$file" > "$temp_file"
else
  # Default to treating value as a string
  jq --arg key "$key" --arg value "$value" '. + { ($key): $value }' "$file" > "$temp_file"
fi

# Check if jq command succeeded
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to update JSON file."
  rm -f "$temp_file"
  exit 1
fi

# Replace the original file with the updated one
mv "$temp_file" "$file"

echo "Key-value pair added successfully."