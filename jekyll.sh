#/bin/sh
docker run --rm -it --volume=$(pwd):/srv/jekyll -p 3000:4000 jekyll/jekyll $1
