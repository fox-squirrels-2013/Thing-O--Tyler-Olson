require_relative '../../app'

class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :song_name
      t.string :artist
      t.string :length
      t.string :genre

      t.timestamps
    end
  end
end