#!/bin/bash
# git aliases

git-fixup() {
	for f in $(git status --porcelain --ignore-submodules -uno | awk '{print $2}'); do
		git add $f
		git log -n 1 --pretty=format:%h -- $f | xargs git commit --fixup;
	done
}

git-autosquash() {
   git fetch
   git rebase origin/$1 -i --autosquash
}
