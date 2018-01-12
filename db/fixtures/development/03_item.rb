index = 1
50.times do
  Item.seed do |s|
    s.id = index
    s.item_name = "盤#{index}"
    s.label = "レーベル#{index}"
    s.release_date = Date.today
    # Thu, 11 Jan 2018
    s.price = index
    s.artist_id = Artist.find_by(artist_name: "歌手#{index}").id
    s.category_id = Category.find_by(category_name: "カテゴリー#{index}").id
    s.image = Rails.root.join("db/fixtures/images/sawa1.JPG").open
    index += 1
  end
end
