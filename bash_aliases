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

git-submodule-rm() {
   if [ -z "$1" ]; then echo "which submodule?"; return; fi
   if [ -z $(ls .git/) ]; then echo "must be in .git root"; return; fi
   git submodule deinit -f -- "$1"
   rm -rf .git/modules/"$1"
   git rm -f "$1"
}

git-reset-branch() {
   current=$(git rev-parse --abbrev-ref HEAD)
   git checkout origin/"$current"
   git branch -D "$current"
   git checkout -b "$current"
}

git-fix-author-cujo() {
   if [ -z "$1" ]; then echo "which branch tip?"; return; fi
   git rebase "origin/$1" --exec "(git show | grep '@cujo.com') || git commit --amend --author='Pedro Tammela <pctammela@cujo.com>'"
}

# X utils

file-copy() {
   if [ -z "$1" ]; then echo "which file?"; return; fi
   xclip -i < "$1"
}
