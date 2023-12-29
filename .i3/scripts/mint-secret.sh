#!/bin/bash

set -eou pipefail

readonly secrets_dir=$HOME/.secrets
readonly prerequisites=(gpg pwgen)
readonly notification_timeout_ms=4000

ensure_installed() (
    for cmd in "$@"; do
        if ! [ -x "$(command -v "$cmd" -q)" ]; then
            echo "$cmd not found. Please install $cmd before running this script" >&2
            exit 1
        fi
    done
)

usage() {
    cat <<EOF
Usage: $0 NAME LENGTH

Generate a random secret and store it (in encrypted form) in $secrets_dir.
EOF

    exit 1
}

[[ ${2:-} ]] || usage
name=$1
length=$2

ensure_installed "${prerequisites[@]}"

if [[ -f $secrets_dir/$name.gpg ]]; then
    notify-send "Secret not created: '$name.gpg' already exists" \
        --expire-time=$notification_timeout_ms \
        --urgency=critical
    exit 1
fi

# Generate a random secret and encrypt it
pwgen -n -y $length 1 | gpg --encrypt --recipient gabi@gotpcrel.net -o $secrets_dir/$name.gpg
notify-send "Secret '$name' successfully created" --expire-time=$notification_timeout_ms
