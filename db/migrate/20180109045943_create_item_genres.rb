class CreateItemGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :item_genres do |t|
      t.integer :item_id, null: false
      t.integer :genre_id, null: false

      t.timestamps
    end
  end
end
