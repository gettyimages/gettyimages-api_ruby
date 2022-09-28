shell = /bin/sh
UID := $(shell id -u)
GID := $(shell id -g)

build:
	bundle config set --local path 'vendor/bundle'
	bundle install --path vendor/bundle
	bundle exec rake
	gem build gettyimages-api.gemspec


# Run a Ruby container with the current directory mounted and as the
# current user. This allows development without installing Ruby on your
# system or if you have a version of Ruby not supported by the SDK.
docker:
	env UID=${UID} GID=${UID} docker run -it --net=host -v /${PWD}:/workdir -w //workdir -u ${UID}:${GID} ruby:2.7 /bin/bash
	