#!/bin/bash

gen_email() {
    local whitelisted_domain="$1"
    if [ -z $whitelisted_domain ]; then
        read -p "[+] Enter whitelisted domain: " whitelisted_domain
    fi

    # Usage
    if [ -z $whitelisted_domain ]; then
        echo -e "\nUsage: $0 <whitelisted-domain>"
        echo "Example: $0 whitelisted.com"
        exit 1
    fi
    
    local prefix_length=$((255 - ${#whitelisted_domain} - 1))

    local random_string=$(head /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c "$prefix_length")
    local final_email="${random_string}@${whitelisted_domain}"

    echo "$final_email"
}



gen_email "$1"
