#!/bin/bash
# Pokémon Data Extraction Script

# Extract values from JSON
name=$(jq -r '.name' data.json)
height_dm=$(jq -r '.height' data.json)
weight_hg=$(jq -r '.weight' data.json)
type=$(jq -r '.types[0].type.name' data.json)

# Convert units
height_m=$(echo "$height_dm" | awk '{printf "%.1f", $1/10}')
weight_kg=$(echo "$weight_hg" | awk '{printf "%.0f", $1/10}')

# Capitalize
name_cap=$(echo "$name" | sed 's/.*/\u&/')
type_cap=$(echo "$type" | sed 's/.*/\u&/')

# Print final message
echo "$name_cap is of type $type_cap, weighs ${weight_kg}kg, and is ${height_m}m tall."
