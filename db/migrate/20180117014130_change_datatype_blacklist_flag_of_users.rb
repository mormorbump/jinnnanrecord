class ChangeDatatypeBlacklistFlagOfUsers < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :blacklist_flag, :integer
  end
end
