#!/bin/bash

set -eou pipefail

SECRETS=$HOME/.secrets
PREREQUISITES=(gpg xclip)
SLEEP_SECONDS=10

ensure_installed() (
    for cmd in "$@"; do
        if ! [ -x "$(command -v "$cmd" -q)" ]; then
            echo "$cmd not found. Please install $cmd before running this script" >&2
            exit 1
        fi
    done
)

ensure_installed "${PREREQUISITES[@]}"

# List all available secrets
secret=$(ls $SECRETS | awk -F '.' '{ print $1 }' | dmenu)

# Decrypt the secret
echo $(gpg --decrypt $SECRETS/$secret.gpg 2>/dev/null) | xclip -in
# Wait for a few seconds...
sleep $SLEEP_SECONDS
# ...and then clear the clipboard
xclip -i /dev/null
