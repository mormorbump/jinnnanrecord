class RemoveBlacklistFlagFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :blacklist_flag, :string
  end
end
