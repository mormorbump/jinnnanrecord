class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
