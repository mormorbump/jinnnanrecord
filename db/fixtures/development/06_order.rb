index = 1
10.times do
	Order.seed do |s|
	  s.user_id = "#{index}"
	  s.last_name = "顧客#{index}"
	  s.first_name = "太郎#{index}"
	  s.last_name_kana = "コキャク#{index}"
	  s.first_name_kana = "タロウ#{index}"
	  s.postal_code = "0000000"
	  s.address = "東京都渋谷区神南"
	  s.tel_num = "09000000000"
	  s.total_price = 100
	  s.deliver = 1
	  s.payment = 1
	  s.status = 1
	  index += 1
	end
end