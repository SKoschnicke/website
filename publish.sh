# Note that, for this to work, the master branch needs to be renamed to
# "source" and the build website will be put into the master branch. This is
# suitable for publishing to GitHub.

# Temporarily store uncommited changes
git stash

# Verify correct branch
git checkout source

# Build new files
docker run --rm -it --volume=$(pwd):/srv/jekyll jekyll build

# Get previous files
git fetch --all
git checkout master

# Overwrite existing files with new files
rsync -a --filter='P _site/' --filter='P _cache/' --filter='P .git/' --filter='P .gitignore' --delete-excluded _site/ .

# Commit
git add -A
git commit -m "Publish."

# Push
git push origin master:master

# Restoration
git checkout source
git stash pop
