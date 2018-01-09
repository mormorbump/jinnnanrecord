# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  artist_id    :integer
#  item_name    :string
#  label        :string
#  image        :string
#  release_date :date
#  price        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Item < ApplicationRecord
  has_many :cart_items
  has_many :item_genres
  has_many :order_items

end
