index = 1
25.times do
  Track.seed do |s|
    s.id = index
    s.disc_num = index
    s.track_order = 1
    s.song_title = "曲名#{index}"
    s.song_time = '12:00'
    s.artist_id = Artist.find_by(artist_name: "歌手1").id
    s.item_id = Item.find_by(item_name: "盤1").id
    index += 1
  end
end

25.times do
  Track.seed do |s|
    s.id = 25 + index
    s.disc_num = 1
    s.track_order = 1
    s.song_title = "曲名#{index}"
    s.song_time = '12:00'
    s.artist_id = Artist.find_by(artist_name: "歌手1").id
    s.item_id = Item.find(index).id
    index += 1
  end
end
