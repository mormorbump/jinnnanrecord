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
end
