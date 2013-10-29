require 'sinatra'
require 'active_record'	
require_relative './app/models/song'
require_relative './db/seed'



ActiveRecord::Base.establish_connection(adapter:  'postgresql', 
                                        database: 'songs_db')

get '/' do
  @all_songs = Song.all
	erb :songs_page
end

get '/add' do
    erb :add
end

post '/add' do
  Song.create!({ song_name: params[:song_name],
                 artist:    params[:artist],
                 length:    params[:length].to_i,
                 genre:     params[:genre] })
  @all_songs = Song.all
  redirect '/'
end

put '/fav/:id' do
  song = Song.find(params[:id])
  song.song_name = params[:song_name] unless params[:song_name].empty?
  song.artist    = params[:artist] unless params[:artist].empty?
  song.length    = params[:length] unless params[:length].empty?
  song.genre     = params[:genre] unless params[:genre].empty?
  song.save
  redirect '/'
end

get '/update/:id' do
  @song = Song.find(params[:id])
  erb :update
end

put '/update/:id' do
  song = Song.find(params[:id])
  song.song_name = params[:song_name] unless params[:song_name].empty?
  song.artist    = params[:artist] unless params[:artist].empty?
  song.length    = params[:length] unless params[:length].empty?
  song.genre     = params[:genre] unless params[:genre].empty?
  song.save
  redirect '/'
end


get '/delete/:id' do
  @song = Song.find(params[:id])
  erb :delete
end

delete '/delete/:id' do
  Song.find(params[:id]).destroy
  redirect '/'
end