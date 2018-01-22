# == Schema Information
#
# Table name: artists
#
#  id               :integer          not null, primary key
#  artist_name      :string
#  aritst_name_kana :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Artist < ApplicationRecord
	has_many :items
	has_many :tracks

	def display_name
	  self.artist_name
	end
end
