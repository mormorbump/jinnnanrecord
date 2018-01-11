index = 1
10.times do
  Category.seed do |s|
    s.id = index
    s.category_name = "カテゴリー#{index}"
    index += 1
  end
end
