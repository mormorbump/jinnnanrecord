class AddIndexItemIdAndGenreIdToItemGenres < ActiveRecord::Migration[5.1]
  def change
  	add_index :item_genres, [:item_id, :genre_id], :unique => true
  	# add_index :item_genres, [:item_id, :genre_id], unique: true
  end
end
