source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"
gem "rails", "~> 7.0.3"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"

gem "autoprefixer-rails"
gem "bootsnap", require: false
gem "font-awesome-sass", "~> 6.1"
gem 'geocoder', '~> 1.8'
gem "jbuilder"
gem "jsbundling-rails"
gem "redis", "~> 4.0"
gem "sassc-rails"
gem "simple_form", github: "heartcombo/simple_form"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem "dotenv-rails"
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 2.21'
  gem 'rubocop', '~> 1.31', '>= 1.31.1'
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
