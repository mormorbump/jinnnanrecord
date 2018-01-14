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

  attachment :image

  has_many :cart_items
  # accepts_nested_attributes_for :cart_items,allow_destroy: true
  has_many :item_genres
  accepts_nested_attributes_for :item_genres
  has_many :order_items
  has_many :reviews, dependent: :destroy
  has_many :tracks, dependent: :destroy

  has_one :stock

  belongs_to :artist
  belongs_to :category

end
