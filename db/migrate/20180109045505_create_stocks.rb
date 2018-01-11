class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.integer :item_id,null: false
      t.integer :quantity,null: false, default: 0

      t.timestamps
    end
  end
end
