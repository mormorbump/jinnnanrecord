index = 1
50.times do
  Category.seed do |s|
    s.id = index
    s.category_name = "カテゴリー#{index}"
    index += 1
  end
end
