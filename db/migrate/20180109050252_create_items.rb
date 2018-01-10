class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :artist_id, null: false
      t.integer :category_id
      t.string :item_name, null: false,index: true
      t.string :label
      t.string :image_id
      t.date :release_date, null: false
      t.integer :price
      t.timestamps
    end
  end
end
