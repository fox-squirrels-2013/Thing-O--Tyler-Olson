require 'sinatra'
# require_relative './app/models/elephant'

class SinatraApp < Sinatra::Base

	ActiveRecord::Base.establish_connection(adapter: 'postgresql')

	get '/' do
		erb :maps_page
	end
end