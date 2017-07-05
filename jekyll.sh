#/bin/sh
subcommand=${1:-serve}
docker run --rm -it --volume=$(pwd):/srv/jekyll -p 3000:4000 jekyll jekyll $subcommand
