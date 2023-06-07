require 'sqlite3'
require 'active_record'
require_relative "../app/game_app"

ENV["RACK_ENV"] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV["RACK_ENV"])


