#!/usr/bin/env bash

i3-msg "
append_layout /home/free/.i3/layouts/1.json;
exec --no-startup-id urxvt -name guard -e zsh -c 'cd ~/programming/rails/PartyAnimal && guard';
exec --no-startup-id urxvt -name rails_server -e zsh -c 'cd ~/programming/rails/PartyAnimal && rails server';
exec --no-startup-id urxvt -cd ~/programming/rails/PartyAnimal;
exec --no-startup-id urxvt -cd ~/programming/rails/PartyAnimal;
exec --no-startup-id urxvt -cd ~/programming/rails/PartyAnimal;
exec --no-startup-id urxvt -cd ~/programming/rails/PartyAnimal;
"
