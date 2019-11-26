#!/usr/bin/env bash

# git aliases

git-fixup() {
	for f in $(git status --porcelain --ignore-submodules -uno | awk '{print $2}'); do
		git add "$f"
		git log -n 1 --pretty=format:%h -- "$f" | xargs git commit --fixup;
	done
}

git-autosquash() {
   if [ -z "$1" ]; then echo "autosquash which branch?"; return; fi
   git fetch
   git rebase "origin/$1" -i --autosquash
}

# X utils

file-copy() {
   if [ -z "$1" ]; then echo "which file?"; return; fi
   xclip -i < "$1"
}
