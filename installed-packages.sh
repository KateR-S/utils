#!/bin/bash

PLOC="output/Packages"

pacman -Qqe | grep -vx "$(pacman -Qqm)" > "$PLOC.log"
pacman -Qqm > "$PLOC-aur.log"
