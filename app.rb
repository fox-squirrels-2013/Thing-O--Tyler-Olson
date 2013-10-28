require 'sinatra'
require 'active_record'	
require_relative './app/models/map'


ActiveRecord::Base.establish_connection(adapter: 'postgresql')

get '/' do
	erb :maps_page
end
