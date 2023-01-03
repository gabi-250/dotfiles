#!/bin/bash

set -eou pipefail

readonly secrets_dir=$HOME/.secrets
readonly prerequisites=(gpg xclip)
readonly sleep_seconds=10

ensure_installed() (
    for cmd in "$@"; do
        if ! [ -x "$(command -v "$cmd" -q)" ]; then
            echo "$cmd not found. Please install $cmd before running this script" >&2
            exit 1
        fi
    done
)

ensure_installed "${prerequisites[@]}"

# List all available secrets
secret=$(ls $secrets_dir | awk -F '.' '{ print $1 }' | dmenu)

# Decrypt the secret
echo $(gpg --decrypt $secrets_dir/$secret.gpg 2>/dev/null) | xclip -in
# Wait for a few seconds...
sleep $sleep_seconds
# ...and then clear the clipboard
xclip -i /dev/null
