# Build new files
docker run --rm -it --volume=$(pwd):/srv/jekyll jekyll jekyll build

# Upload
rsync -avz --progress --recursive --delete-before _site/ linevast:gfxpro-website/
