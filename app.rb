ENV['BUNDLE_GEMFILE'] ||= File.expand_path('Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'sinatra'
require 'sinatra/reloader' if development? 

require 'pg'

require 'active_support/all'
require 'active_record'
require 'sinatra/activerecord'

require 'erubis'

APP_NAME = "linky"
DB = URI.parse(ENV['DATABASE_URL'] || "postgres://localhost/#{APP_NAME}_#{Sinatra::Application.environment}")
DB_CONFIG = {
  :adapter  => DB.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => DB.host,
  :port     => DB.port,
  :username => DB.user,
  :password => DB.password,
  :database => APP_NAME,
  :encoding => 'utf8'
}

ActiveRecord::Base.establish_connection(DB_CONFIG)

