source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '~> 3.2.20'
gem 'jquery-rails'

gem 'sass'
gem 'haml'

gem 'has_tokens'

gem 'newrelic_rpm'
gem 'unicorn'

gem 'neat', '~> 1.6.0'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'rake'
  gem 'database_cleaner', require: false
  gem 'cucumber-rails', require: false
  gem 'fakefs'
end

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
