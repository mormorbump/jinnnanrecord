class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :item_id,null: false
      t.integer :quantity,null: false, default: 0

      t.timestamps
    end
  end
end
