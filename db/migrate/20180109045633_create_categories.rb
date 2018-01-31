class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :category_name, null: false, index: true
      t.timestamps
    end
  end
end
