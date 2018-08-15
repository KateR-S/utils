#!/bin/bash

awk 'FNR==NR {a[$0]++; next} !a[$0]' ~/noobjaro/packages-aur.new.log ~/noobjaro/packages-aur.old.log | install -D /dev/stdin ~/noobjaro/packages-aur.delta.log
awk 'FNR==NR {a[$0]++; next} !a[$0]' ~/noobjaro/packages.new.log ~/noobjaro/packages.old.log | install -D /dev/stdin ~/noobjaro/packages.delta.log
