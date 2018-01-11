# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  cart_id    :integer
#  item_id    :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart

  validates :quantity,presence: true

  validates :item,presence: true
  validates :cart,presence: true
  validates :cart_id,uniqueness: {scope: :item_id}
end
