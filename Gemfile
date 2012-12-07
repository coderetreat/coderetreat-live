source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '3.2.9'
gem 'jquery-rails'

gem 'sass'
gem 'haml'

gem 'has_tokens'

gem 'newrelic_rpm'
gem 'unicorn'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'rspec-rails'
end

group :test do
  gem 'rake'
  gem 'database_cleaner', require: false
  gem 'cucumber-rails', require: false
  gem 'rspec-rails', require: false
end

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end

