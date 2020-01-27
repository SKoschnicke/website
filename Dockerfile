FROM jekyll/jekyll:3.8

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.5/main' >> /etc/apk/repositories
# we need ruby-dev to compile native gem extensions for jekyll plugins
RUN apk add --no-cache build-base ruby-dev imagemagick=6.9.6.8-r1 imagemagick-dev=6.9.6.8-r1

CMD jekyll build
