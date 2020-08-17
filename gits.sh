#!/usr/bin/env bash
# Recursive `git status` (including sub-modules)

set -e

status_ops="$*"

clear

find . -name '.git' \
	  | while read repo
do
	  repo=${repo//\.git/}
	  git -C "$repo" status -s \
		    | grep -q -v "^\$" \
		    && echo -e "\n\033[1m${repo}\033[m" \
		    && git -C "$repo" status $status_ops \
		        || true
done
