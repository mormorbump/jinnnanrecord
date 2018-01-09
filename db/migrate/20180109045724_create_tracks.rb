class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.integer :item_id
      t.integer :artist_id
      t.integer :disc_num
      t.integer :track_order
      t.string :song_title
      t.time :song_time

      t.timestamps
    end
  end
end
