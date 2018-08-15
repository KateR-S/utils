#!/bin/bash

echo 'is this on the [old] system or the [new]  one?'
read VERSION

pacman -Qqe | grep -vx "$(pacman -Qqm)" | install -D /dev/stdin ~/noobjaro/packages.$VERSION.log
pacman -Qqm | install -D /dev/stdin ~/noobjaro/packages-aur.$VERSION.log
