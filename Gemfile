source 'https://rubygems.org'

gem 'rails', '~> 5.1.3'
gem 'puma', '~> 3.7'
gem 'rest-client',                    '>= 2.0.1'

group :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  gem 'simplecov', require: false
  gem 'vcr'
  gem 'webmock'
end

group :development, :test do
  gem 'pry'
  gem 'listen'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'pry-highlight'
  gem 'dotenv-rails'
end

group :development do
  gem 'rails_best_practices'
  gem 'rubocop'
  gem 'awesome_print', require: false
end
