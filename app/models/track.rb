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
	belongs_to :item
	belongs_to :artist

	def display_name
	  self.song_title
	end

  class << self
    # 何枚組のCDか求める
    def disc_num_of_sheets
      group(:disc_num).max.disc_num
    end
    # 収録曲の合計
    def sum_of_songs
      song_time = group(:song_time).sum(:song_time)
    end
  end
end
