#!/usr/bin/env bash

sudo rm /repo/x86_64/packages/custom.db.tar.gz
sudo repo-add --files /repo/x86_64/packages/custom.db.tar.gz /repo/x86_64/packages/*pkg.tar*
sudo pacman -Syu --config=/etc/pacman.d/custom-repo.conf
