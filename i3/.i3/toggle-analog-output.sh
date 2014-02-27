#!/bin/bash

TOGGLE=$HOME/.speakers-enabled

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
	amixer cset -c0 -q name='Analog Output',index=0 Speakers
else
    rm $TOGGLE
	amixer cset -c0 -q name='Analog Output',index=0 Headphones
fi
