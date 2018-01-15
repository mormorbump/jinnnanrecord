index = 1

Genre.seed do |s|
    s.id = index
    s.genre_name = "Rock"
    index += 1
  end
Genre.seed do |s|
    s.id = index
    s.genre_name = "Pop"
    index += 1
  end
Genre.seed do |s|
    s.id = index
    s.genre_name = "Jazz"
    index += 1
  end
Genre.seed do |s|
    s.id = index
    s.genre_name = "R&B"
    index += 1
  end
Genre.seed do |s|
    s.id = index
    s.genre_name = "演歌"
    index += 1
  end
  Genre.seed do |s|
    s.id = index
    s.genre_name = "Blues"
    index += 1
  end

