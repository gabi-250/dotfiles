#!/bin/bash

set -eou pipefail

readonly ALACRITTY_CONFIG=~/.alacritty.yml
readonly ALACRITTY_COLORS=~/.config/alacritty/colors.yml
readonly ALACRITTY_LIGHT=~/.config/alacritty/colors-light.yml
readonly ALACRITTY_DARK=~/.config/alacritty/colors-dark.yml

if [[ `readlink -f $ALACRITTY_COLORS` == `readlink -f $ALACRITTY_LIGHT` ]]; then
    ln -fs $ALACRITTY_DARK $ALACRITTY_COLORS
elif [[ `readlink -f $ALACRITTY_COLORS` == `readlink -f $ALACRITTY_DARK` ]]; then
    ln -fs $ALACRITTY_LIGHT $ALACRITTY_COLORS
fi

touch $ALACRITTY_CONFIG
