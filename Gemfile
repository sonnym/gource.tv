source 'https://rubygems.org'

# core
gem 'rails', '4.0.0'

# database
gem 'mysql2'
gem 'foreigner'

# integration
gem 'rugged'
gem 'youtube_it'

# jobs
gem 'resque'

# assets
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'js-routes'

group :development do
  gem 'capistrano', '~> 2.15'
  gem 'capistrano-resque', git: 'git@github.com:sonnym/capistrano-resque.git', branch: :redirect_output
end

group :development, :test do
  gem 'pry'
end
