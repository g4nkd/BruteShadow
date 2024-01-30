#!/bin/bash

hashtrue=$3

echo "Types of hash:"
echo "1  | MD5"
echo "2a | Blowfish"
echo "5  | SHA-256"
echo "6  | SHA-512
"

if [ $# -ne 3 ]; then
    echo "Usage mode: $0 <wordlist> <salt> <hash> <tipo>"
    exit 1
fi

if [ ! -e "$1" ]; then
    echo "Wordlist file not found: $1"
    exit 1
fi

while IFS= read -r line; do
    passwd=$(openssl passwd $4 -salt "$2" "$line" | cut -d "$" -f4)

    if [ "$passwd" == "$hashtrue" ]; then
        echo "Password: $line"
        exit 0
    else
        echo "Trying: $line"
    fi
done < "$1"

echo "Password not found :("
exit 1

