# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  genre_name :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Genre < ApplicationRecord
	has_many :item_genres

	def display_name
		self.genre_name
	end
end
