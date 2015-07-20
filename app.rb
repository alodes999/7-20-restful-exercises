require 'rubygems'
require 'bundler/setup'

require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/cross_origin'
require 'bcrypt'

configure :development do
  require 'sqlite3'
  ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'your_database.db')
end

configure :production do  
  require 'pg'
  db = URI.parse(ENV['DATABASE_URL'])

  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end

#models

require_relative "models/user.rb"
require_relative "models/story.rb"
#controllers

require_relative "controllers/user_controller.rb"
require_relative "controllers/story_controller.rb"
require_relative "controllers/home_controller.rb"