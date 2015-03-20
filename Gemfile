source 'https://rubygems.org'

# core
gem 'rails', '~> 4.2.1'
gem 'pry-rails'

gem 'exception_notification'

# database
gem 'mysql2'
gem 'foreigner'

# integration
gem 'dotenv-rails'
gem 'rugged'
gem 'youtube_it'

# jobs
gem 'resque', github: 'sonnym/resque', branch: 'remove_eager_loading'

# assets
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'js-routes'
gem 'sitemap_generator'

group :production do
  gem 'therubyracer'
  gem 'prerender_rails'
end

group :development do
  gem 'capistrano', '~> 2.15'
  gem 'capistrano-resque', github: 'sonnym/capistrano-resque', branch: 'v0.0.7-discard-log'
end

group :test do
  gem 'mocha', require: false
end
