class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :quantity
      t.integer :sub_total_price

      t.timestamps
    end
  end
end
