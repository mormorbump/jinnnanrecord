class AddLastNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :nickname, :string
    add_column :users, :postal_code, :string
    add_column :users, :address, :string
    add_column :users, :tel_num, :string
    add_column :users, :blacklist_flag, :string
  end
end
