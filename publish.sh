# Build new files
docker run --rm -it --volume=$(pwd):/srv/jekyll jekyll build
