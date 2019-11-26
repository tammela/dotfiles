# git aliases

gitfixup() {
	for f in $(git status --porcelain --ignore-submodules -uno | awk '{print $2}'); do
		git add $f
		git log -n 1 --pretty=format:%h -- $f | xargs git commit --fixup;
	done
}
