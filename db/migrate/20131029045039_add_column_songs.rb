class AddColumnSongs < ActiveRecord::Migration
  def change
    add_column :songs, :favorite, :boolean, :default => false
  end
end
