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

  def review_average
    reviews.average(:rate)
    # 頭のself.を省略している。selfはメソッドを使ったレシーバ（自分自身）を代入できるメソッド。productに使ってproductのreviewsの平均値を取りたいのでself.~として省略したみたいな感じ。.roundは四捨五入して整数にするメソッド。
  end

  def average_rate_star
    case review_average.round
      when 1 then
         "★☆☆☆☆"
      when 2 then
         "★★☆☆☆"
      when 3 then
         "★★★☆☆"
      when 4 then
         "★★★★☆"
      when 5 then
         "★★★★★"
      end
  end

  def user_review_exists?(user)
    reviews.where(user_id: user.id).presence
  end

# returnのところでメソッドが止まるのでこれでおっけー
  def user_ordered?(user)
    order_items.each do |order_item|
      return true if order_item.order.user_id == user.id
    end
    return false
  end
end
