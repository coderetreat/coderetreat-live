source 'http://rubygems.org'

gem 'rails', '3.1.3'
gem 'haml'
gem 'sass'
gem 'sass-rails',   '~> 3.1.4'

gem 'jquery-rails'

group :assets do
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'rspec-rails', :group => [:development, :test]

group :development do
  gem 'heroku'
  gem 'sqlite3'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'sqlite3'
  gem 'cucumber-rails'
end

group :production do
  gem 'pg'
end
