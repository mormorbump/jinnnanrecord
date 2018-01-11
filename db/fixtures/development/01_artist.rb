index = 1
10.times do
  Artist.seed do |s|
    s.id = index
    s.artist_name = "歌手#{index}"
    s.artist_name_kana = "カシュ#{index}"
    index += 1
  end
end
