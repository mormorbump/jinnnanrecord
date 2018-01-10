class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :artist_id
      t.string :item_name
      t.string :label
      t.string :image_id
      t.date :release_date
      t.integer :price

      t.timestamps
    end
  end
end
