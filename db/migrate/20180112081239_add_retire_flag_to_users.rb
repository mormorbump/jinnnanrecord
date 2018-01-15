class AddRetireFlagToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :retire_flag, :boolean, default: false, null: false
  end
end
