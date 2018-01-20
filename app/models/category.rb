# == Schema Information
#
# Table name: categories
#
#  id            :integer          not null, primary key
#  item_id       :integer
#  category_name :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Category < ApplicationRecord
  has_one :item

  validates :category_name, presence: true
  
	def display_name
	  self.category_name
	end
end
