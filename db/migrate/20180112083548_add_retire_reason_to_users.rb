class AddRetireReasonToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :retire_reason, :string
  end
end
