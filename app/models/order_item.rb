# == Schema Information
#
# Table name: order_items
#
#  id              :integer          not null, primary key
#  order_id        :integer
#  item_id         :integer
#  quantity        :integer
#  sub_total_price :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :sub_total_price, presence: true

  validates :item_id,presence: true
  validates :order_id,presence: true
  validates :item_id,uniqueness: {scope: :order_id}
end
