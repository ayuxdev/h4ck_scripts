#!/bin/bash

gen_email() {
    local whitelisted_domain="$1"
    local prefix_length=$((255 - ${#whitelisted_domain} - 1))

    local random_string=$(head /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c "$prefix_length")
    local final_email="${random_string}@${whitelisted_domain}"

    echo "$final_email"
}

# Usage
if [ $# -eq 0 ]; then
    echo "Usage: $0 <whitelisted-domain>"
    echo "Example: $0 whitelisted.com"
    exit 1
fi

gen_email "$1"
