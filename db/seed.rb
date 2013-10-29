require 'faker'
require_relative '../app.rb'
require_relative '../app/models/song'


class SeedSongs
  def self.makesongs!
    10.times do
      Song.create!({ song_name: Faker::Lorem.sentence,
                     artist:    Faker::Lorem.word,
                     length:    rand(150..300),
                     genre:     Faker::Lorem.word })
    end
  end
end
