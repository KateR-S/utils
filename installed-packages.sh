#!/bin/bash

pacman -Qqe | grep -vx "$(pacman -Qqm)" | install -D /dev/stdin ~/noobjaro/packages.log
pacman -Qqm | install -D /dev/stdin ~/noobjaro/packages-aur.log
