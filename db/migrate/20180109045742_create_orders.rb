class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id, null: false
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :tel_num, null: false
      t.integer :total_price, null: false, default: 0
      t.integer :deliver, null: false, default: 0
      t.integer :payment, null: false, default: 0

      t.timestamps
    end
  end
end
