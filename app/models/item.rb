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

  def review_average
    reviews.average(:rate).round
    # 頭のself.を省略している。selfはメソッドを使ったレシーバ（自分自身）を代入できるメソッド。productに使ってproductのreviewsの平均値を取りたいのでself.~として省略したみたいな感じ。.roundは四捨五入して整数にするメソッド。
  end

end
