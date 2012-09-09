source :rubygems

gem 'rails', '3.2.8'
gem 'sqlite3'
gem 'jquery-rails'
gem 'puma'

group :development do
  gem 'capistrano'
  gem 'capistrano_colors'
  gem 'rvm-capistrano'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'

  # Not required on MacOS, but good to have dev use the prod code path,
  # and there is no (nice) way to exclude OS/hardware arches in bundler.
  gem 'therubyracer', :platforms => :ruby
end
