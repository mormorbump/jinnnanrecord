class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :artist_name, null: false,index: true
      t.string :artist_name_kana, null: false,index: true

      t.timestamps
    end
  end
end
