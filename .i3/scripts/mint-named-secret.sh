#!/bin/bash

set -eou pipefail

readonly prompt="specify a name for the new secret"
readonly scripts_dir="$HOME/.i3/scripts"
readonly length=20

abort() {
    echo 'Failed to mint secret: missing name.'
    exit 1
}

name=$(echo | dmenu -p "$prompt")

[[ $name ]] || abort

$scripts_dir/mint-secret.sh $name $length
