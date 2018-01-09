# == Schema Information
#
# Table name: tracks
#
#  id          :integer          not null, primary key
#  item_id     :integer
#  artist_id   :integer
#  disc_num    :integer
#  track_order :integer
#  song_title  :string
#  song_time   :time
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Track < ApplicationRecord
end
