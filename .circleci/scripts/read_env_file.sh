#!/usr/bin/env bash
# Read environment variables from .env file located from where this scrip is executed

echo "Reading environment variables from .env file. Values set are:"
# open file and export all non empty lines as environment variables
while read -r line || [[ -n "$line" ]]; do
  if [[ -n "$line" ]]; then
    export "$line"
    # print exported environment variable
    echo "$line"
  fi
done < .env