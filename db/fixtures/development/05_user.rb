index = 1
10.times do
	User.seed do |s|
	  s.email = "test#{index}@test.jp"
	  s.password = "testtest"
	  s.sign_in_count = 0
	  s.last_name = "顧客#{index}"
	  s.last_name_kana = "太郎#{index}"
	  s.first_name = "コキャク#{index}"
	  s.first_name_kana = "タロウ#{index}"
	  s.postal_code = "0000000"
	  s.address = "東京都渋谷区神南"
	  s.tel_num = "09000000000"
	  s.blacklist_flag = "false"
	  index += 1
	end
end
