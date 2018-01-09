class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :artist_name
      t.string :aritst_name_kana

      t.timestamps
    end
  end
end
