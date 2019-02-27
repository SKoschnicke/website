FROM jekyll/jekyll:3.8

# we need ruby-dev to compile native gem extensions for jekyll plugins
RUN apk add --no-cache build-base ruby-dev imagemagick imagemagick-dev

CMD jekyll build
