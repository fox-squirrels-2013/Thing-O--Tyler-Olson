require 'sinatra/activerecord/rake'
require './app'

# namespace :db do
#   desc "create the postgres database"
#   task :create do
#     `createdb songs_db`
#   end

#   desc "drop the postgres database"
#   task :drop do
#     `dropdb songs_db`
#   end

  desc "seed the postgres database"
  task :seed do
    SeedSongs.makesongs!
  end

end
