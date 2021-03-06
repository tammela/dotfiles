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

clang-init-c() {
   cp -iv ~/.clang-configs/clang-tidy-c ./.clang-tidy
   cp -iv ~/.clang-configs/clang-format ./.clang-format
}

clang-init-cpp() {
   cp -iv ~/.clang-configs/clang-tidy-cpp ./.clang-tidy
   cp -iv ~/.clang-configs/clang-format ./.clang-format
}

alias ls='ls --color=auto'
