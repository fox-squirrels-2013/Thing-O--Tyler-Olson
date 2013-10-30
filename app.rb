require 'sinatra'
require 'active_record'	
require_relative './app/models/song'
require_relative './db/seed'


ActiveRecord::Base.establish_connection(adapter:  'postgresql', 
  database: 'songs_db')

get '/' do
  @all_songs = Song.all :order => :id  
  erb :songs_page
end

get '/new' do
  erb :new
end

post '/' do
  Song.create!({ song_name: params[:song_name],
                 artist:    params[:artist],
                 length:    params[:length].to_i,
                 genre:     params[:genre] })
  redirect '/'
end

# need to make RESTful - as a put request
get '/fav/:id' do
  s = Song.find(params[:id])
  s.favorite = !s.favorite
  s.save
  redirect '/'
end

get '/:id/edit' do
  @song = Song.find(params[:id])
  erb :update
end

put '/:id' do
  s = Song.find(params[:id])
  s.song_name = params[:song_name] unless params[:song_name].empty?
  s.artist    = params[:artist] unless params[:artist].empty?
  s.length    = params[:length] unless params[:length].empty?
  s.genre     = params[:genre] unless params[:genre].empty?
  s.save
  redirect '/'
end

get '/:id/delete' do
  @song = Song.find(params[:id])
  erb :delete
end

delete '/:id' do
  Song.find(params[:id]).destroy
  redirect '/'
end
