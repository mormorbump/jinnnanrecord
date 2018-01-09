class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.integer :item_id
      t.integer :quantity

      t.timestamps
    end
  end
end
