require 'sinatra'
require 'active_record'	
require_relative './app/models/map'


ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'maps_db')

get '/' do
	erb :maps_page
end
