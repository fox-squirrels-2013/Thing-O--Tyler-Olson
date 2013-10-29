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


get '/update/:id' do
  @song = Song.find(params[:id])
  erb :update
end

put '/update/:id' do
  song = Song.find(params[:id])
  song.song_name = params[:song_name]
  song.artist    = params[:artist]
  song.length    = params[:length]
  song.genre     = params[:genre]
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