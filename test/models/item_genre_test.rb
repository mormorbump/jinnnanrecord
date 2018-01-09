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

require 'test_helper'

class ItemGenreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
