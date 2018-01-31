class CreateGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :genres, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :genre_name, null: false,index: true
      t.timestamps
    end
  end
end
