source 'https://rubygems.org'

ruby '1.9.2'
gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production, :staging do
    gem "heroku"
    gem "pg"
end

group :development, :test do
    gem 'sqlite3'
end


gem 'sass-rails',   '~> 3.2.3'
gem 'coffee-rails', '~> 3.2.1'
gem 'ember-rails'
gem 'ember-source', '1.0.0.rc5' # or the version you need
gem 'handlebars-source', '1.0.0.rc4' # or the version you need

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', :platforms => :ruby

gem 'uglifier', '>= 1.0.3'

group :development, :test do # development so generators work
    gem 'rspec-rails', '~> 2.0'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem "bcrypt-ruby", "~> 3.0.1"

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
#
gem 'seatgeek', git: 'https://github.com/bluefocus/seatgeek.git'
