#!/usr/bin/env bash

i3-msg "
focus parent
append_layout /home/free/.i3/layouts/2.json;
exec --no-startup-id urxvt;
"
