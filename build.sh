#!/bin/sh

docker build -t jekyll .

docker run --rm \
  --volume="$PWD:/srv/jekyll" \
  -it jekyll \
  jekyll build
