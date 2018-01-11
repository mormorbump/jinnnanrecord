class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :item_id, null: false
      t.integer :rate,null: false,default: 6
      t.text :review

      t.timestamps
    end
  end
end
