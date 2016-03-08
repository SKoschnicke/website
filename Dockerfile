FROM jekyll/jekyll:3.0

# we need ruby-dev to compile native gem extensions for jekyll plugins
RUN apk add --no-cache build-base ruby-dev imagemagick-dev