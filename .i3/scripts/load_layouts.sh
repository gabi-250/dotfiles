#!/bin/bash

i3-msg "workspace 5; append_layout /home/gabi/.i3/workspaces/workspace-1.json"

(xterm &)
(gvim &)
(gvim &)
