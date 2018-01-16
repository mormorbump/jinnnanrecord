# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  item_id    :integer
#  rate       :integer
#  review     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item

  def rate_star
    case rate
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
end
