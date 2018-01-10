class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.integer :item_id, null: false
      t.integer :artist_id, null: false
      t.integer :disc_num, null: false, default: 1
      t.integer :track_order, null: false
      t.string :song_title, null: false, index: true
      t.time :song_time, null: false

      t.timestamps
    end
  end
end
