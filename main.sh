#!/bin/bash

# Function to increment the usage count
increment_usage_count() {
  current_count=$(cat usage_count.jsonl | jq -r '.doc')
  new_count=$((current_count + 1))
  echo "{\"doc\": $new_count}" > usage_count.jsonl
}

# Function to check if ./generate_static should be run
check_generate_static() {
  current_count=$(cat usage_count.jsonl | jq -r '.doc')
  if [ $((current_count % 6)) -eq 0 ]; then
    ./generate_static.sh >> /dev/null 2>&1
  fi
}

check_generate_static

# Function to make API call
make_api_call() {
  read -p "Enter your question: " question
  question="You are terminal help guide. I have provided you my linux distribution and specs. Just answer very briefly. $question"
  curl --data "{\"user\": \"user\", \"query\": \"$question\"}" http://localhost:8080/
}

# Main script
make_api_call
increment_usage_count

# echo "Script executed successfully!"
