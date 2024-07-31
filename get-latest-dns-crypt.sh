#!/bin/ash

# Replace with your repository owner and name
repo_owner="DNSCrypt"
repo_name="dnscrypt-proxy"

# Replace with expected binary filename
base_binary_name="dnscrypt-proxy-linux_x86_64"
binary_output_name="dnscrypt-proxy"

# Function to download a file
download() {
  local url="$1"
  local filename="$2"
  curl -L "$url" -o "$filename"
}

# Get the latest release information
release_info=$(curl -s https://api.github.com/repos/$repo_owner/$repo_name/releases/latest)

# Extract the tag_name (version) from the JSON response
tag_name=$(echo "$release_info" | jq -r '.tag_name')

# Construct the final binary name
binary_name="${base_binary_name}-${tag_name}.tar.gz"

# Extract the binary download URL from the JSON response
binary_url="https://github.com/$repo_owner/$repo_name/releases/download/$tag_name/$binary_name"

# Download the binary
download "$binary_url" "$binary_output_name"