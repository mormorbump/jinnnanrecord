# == Schema Information
#
# Table name: item_genres
#
#  id         :integer          not null, primary key
#  item_id    :integer
#  genre_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ItemGenre < ApplicationRecord
	belongs_to :item
	belongs_to :genre

  # validates :item_id,presence: true
  # validates :genre_id,presence: true
  validates :item_id,uniqueness: {scope: :genre_id}
end