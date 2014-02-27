#!/usr/bin/env bash

while true; do
	official=$(checkupdates)
	aur=$(cower -u | gawk '{print $2}')

	if [[ $official ]]; then
		notify-send "Official" "$official"
	fi
	if [[ $aur ]]; then
		notify-send "AUR" "$aur"
	fi
	sleep 7200
done
