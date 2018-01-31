class CreateCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_items, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :cart_id, null: false
      t.integer :item_id, null: false
      t.integer :quantity, null: false, default: 0

      t.timestamps
    end
  end
end
