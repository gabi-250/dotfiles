#!/bin/bash

set -eou pipefail

readonly ALACRITTY_CONFIG=~/.alacritty.toml
readonly ALACRITTY_COLORS=~/.config/alacritty/colors.toml
readonly ALACRITTY_LIGHT=~/.config/alacritty/colors-light.toml
readonly ALACRITTY_DARK=~/.config/alacritty/colors-dark.toml

readonly AERC_COLORS=~/.config/aerc/stylesets/gruvbox
readonly AERC_LIGHT=~/.config/aerc/stylesets/gruvbox-light
readonly AERC_DARK=~/.config/aerc/stylesets/gruvbox-dark

if [[ `readlink -f $ALACRITTY_COLORS` == `readlink -f $ALACRITTY_LIGHT` ]]; then
    ln -fs $ALACRITTY_DARK $ALACRITTY_COLORS
    ln -fs $AERC_DARK $AERC_COLORS
elif [[ `readlink -f $ALACRITTY_COLORS` == `readlink -f $ALACRITTY_DARK` ]]; then
    ln -fs $ALACRITTY_LIGHT $ALACRITTY_COLORS
    ln -fs $AERC_LIGHT $AERC_COLORS
fi

touch $ALACRITTY_CONFIG
