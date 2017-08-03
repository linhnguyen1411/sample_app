source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 5.1.2"
gem "config"
gem "bcrypt", "3.1.11"
gem "bootstrap-sass", "3.3.7"
gem "faker", "1.7.3"
gem "will_paginate", "3.1.5"
gem "bootstrap-will_paginate", "1.0.0"
gem "carrierwave",             "1.1.0"
gem "mini_magick",             "4.7.0"
gem "fog",                     "1.40.0"
# Use sqlite3 as the database for Active Record
# Use Puma as the app server
gem "puma", "~> 3.7"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem "therubyracer", platforms: :ruby
# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"
gem "jquery-rails", "4.3.1"
gem "rubocop", "~> 0.49.1", require: false
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 3.0"
# Use ActiveModel has_secure_password
# gem "bcrypt", "~> 3.1.7"
# Use Capistrano for deployment
# gem "capistrano-rails", group: :development

group :development, :test do
  gem "sqlite3", "1.3.13"
  # Call "byebug" anywhere in the code
  # to stop execution and get a debugger console
  gem "pry-rails"
  gem "byebug", platforms: :mri
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :development do
  # Access an IRB console on exception
  # pages or by using <%= console %> anywhere in the code.
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"
  # Spring speeds up development by keeping
  # your application running in the background.
  # Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
group :test do
  gem "guard",                    "2.13.0"
  gem "guard-minitest",           "2.4.4"
  gem "minitest-reporters",       "1.1.14"
  gem "rails-controller-testing", "1.0.2"
end

group :production do
  gem "pg", "0.18.4"
end
