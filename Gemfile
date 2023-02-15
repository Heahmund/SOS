source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# gem 'rails', '~> 5.2.3'
gem 'rails', '~> 5.2.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
# Use CoffeeScript for .coffee assets and views
gem 'jquery-rails'
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'sdoc', '~> 0.4.0',          group: :doc
# gem 'bcrypt', '~> 3.1.7'
gem 'rails-controller-testing'
gem 'slim-rails'
gem 'twitter-bootstrap-rails', git: 'git@github.com:seyhunak/twitter-bootstrap-rails.git'
gem 'carrierwave'
gem 'remotipart'
gem 'private_pub'
gem 'thin'
gem 'inherited_resources'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-vkontakte'
gem 'omniauth-github'
gem "omniauth-rails_csrf_protection"

gem 'cancan'
gem 'doorkeeper', '> 4.4.0'
gem "active_model_serializers"
gem 'oj'
gem 'oj_mimic_json'
gem 'redis-throttle', git: 'git@github.com:andreareginato/redis-throttle.git'
#gem 'delayed_job_active_record'
gem 'whenever'
gem 'sidekiq', '~> 5.2.0'
gem 'sinatra', '>= 1.3.0', require: nil
gem 'mysql2'
gem 'thinking-sphinx'
# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks


# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'devise'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
gem 'dotenv-rails'
# gem 'dotenv'
# gem 'dotenv-deployment', require: 'dotenv/deployment'
gem 'therubyracer'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'capybara', '>= 2.15'
  gem 'capybara-webkit'
  gem 'launchy'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano', '~> 3.2.1', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-sidekiq', require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'json_spec'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
  gem 'shoulda-matchers'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
