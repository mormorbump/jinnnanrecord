class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :quantity, null: false, default: 1
      t.integer :sub_total_price, null: false,default: 0

      t.timestamps
    end
  end
end
