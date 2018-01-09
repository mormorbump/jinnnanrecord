class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :postal_code
      t.string :address
      t.string :tel_num
      t.integer :total_price
      t.integer :deliver
      t.integer :payment

      t.timestamps
    end
  end
end
