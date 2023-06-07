require 'sinatra/activerecord/rake'
require_relative './config/environment'

task :console do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    Pry.start
end

