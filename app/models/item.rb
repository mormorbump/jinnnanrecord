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
  has_many :item_genres, dependent: :destroy
  accepts_nested_attributes_for :item_genres, allow_destroy: true
  has_many :order_items
  has_many :reviews, dependent: :destroy
  has_many :tracks, dependent: :destroy
  accepts_nested_attributes_for :tracks, :allow_destroy => true

  has_one :stock, dependent: :destroy
  accepts_nested_attributes_for :stock, :allow_destroy => true

  belongs_to :artist
  belongs_to :category

  def display_name
  	self.item_name
  end

end
