source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord', '~> 5.2'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'shotgun'
gem 'bcrypt'
gem 'tux'
gem 'faker'
gem 'rack-cors'
gem 'rack-contrib'
gem 'dotenv'
gem 'psych', '~> 4.0.0'
gem 'uri'


group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
end  

#use pry in the development phase only
group :development do
  gem "pry"
  gem "sqlite3"

  # Automatically reload when there are changes
  # https://github.com/alexch/rerun
  gem "rerun"
end

group :production do
    gem "pg"
end