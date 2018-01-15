# == Schema Information
#
# Table name: stocks
#
#  id         :integer          not null, primary key
#  item_id    :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Stock < ApplicationRecord
	belongs_to :item
end
