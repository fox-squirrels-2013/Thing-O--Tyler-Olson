require 'sinatra'
require 'active_record'	
require_relative './app/models/song'
require_relative './db/seed'


# ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb1')

ActiveRecord::Base.establish_connection(adapter:  'postgresql')

get '/' do
  @all_songs = Song.all :order => :id  
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

# need to make as a put request
get '/fav/:id' do
  s = Song.find(params[:id])
  s.favorite = !s.favorite
  s.save
  redirect '/'
end

get '/update/:id' do
  @song = Song.find(params[:id])
  erb :update
end

put '/update/:id' do
  s = Song.find(params[:id])
  s.song_name = params[:song_name] unless params[:song_name].empty?
  s.artist    = params[:artist] unless params[:artist].empty?
  s.length    = params[:length] unless params[:length].empty?
  s.genre     = params[:genre] unless params[:genre].empty?
  s.save
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
