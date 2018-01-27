class RemoveEmailIndexFromUser < ActiveRecord::Migration[5.1]

  # migrate時に実行
  def up
    # usersテーブルのemailのindex(ユニーク制約)を外し、emailとsoft_destroyed_atのユニーク制約を貼る。
    remove_index :users, :email
    add_index :users, [:email, :soft_destroyed_at], unique: true
  end

  # rollback時に実行
  def down
    remove_index :users, [:email, :soft_destroyed_at]
    add_index :users, :email, unique: true
  end
end
