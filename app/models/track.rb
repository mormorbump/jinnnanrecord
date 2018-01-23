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

  validates :disc_num, presence: true
  validates :track_order, presence: true
  validates :song_title, presence: true
  validates :song_time, presence: true

  class << self
    # 何枚組のCDか求める
    def disc_num_of_sheets
      group(:disc_num).max.disc_num
    end
    # 収録曲の合計
    def sum_of_songs
      song_time = group(:item_id).sum(:song_time)    
    end
  end
end
