build:
	bundle config set --local path 'vendor/bundle'
	bundle install --path vendor/bundle
	bundle exec rake
	gem build gettyimages-api.gemspec
