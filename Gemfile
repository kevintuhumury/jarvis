source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.1'
gem 'puma', '~> 3.11'
gem 'pg'

gem 'devise'
gem 'haml'
gem 'simple_form'
gem 'friendly_id', '~> 5.2.4'
gem 'awesome_nested_set', '~> 3.1.1'
gem 'bootsy'
gem 'newrelic_rpm'

gem 'sass-rails', '~> 5.0'
gem 'compass-rails'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer'

# Use CoffeeScript for .coffee assets and views
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
  gem 'fabrication'
  gem 'capybara'
  gem 'pry-nav'
  gem 'simplecov'
end
