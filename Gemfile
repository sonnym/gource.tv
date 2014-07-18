source 'https://rubygems.org'

# core
gem 'rails', '~> 4.0.0'
gem 'pry-rails'

# database
gem 'mysql2'
gem 'foreigner'

# integration
gem 'dotenv-rails'
gem 'rugged'
gem 'youtube_it'

# jobs
gem 'resque', git: 'git@github.com:sonnym/resque.git', branch: 'remove_eager_loading'

# assets
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'js-routes'

group :production do
  gem 'therubyracer'
end

group :development do
  gem 'capistrano', '~> 2.15'
  gem 'capistrano-resque', git: 'git@github.com:sonnym/capistrano-resque.git', branch: 'v0.0.7-discard-log'
end

group :development, :test do
  gem 'pry'
end
