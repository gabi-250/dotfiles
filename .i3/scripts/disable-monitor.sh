#!/bin/bash

set -eou pipefail

hdmi_output=$(xrandr | rg -i "hdmi.* connected" | awk -e '{ print $1 };' || echo '')
dp_output=$(xrandr | rg -i "dp.* connected" | awk -e '{ print $1 };')

if [[ $hdmi_output ]]; then
    xrandr --output $dp_output --off
    xrandr --output $hdmi_output --auto --primary
else
    xrandr --output $dp_output --auto --primary
fi
