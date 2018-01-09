# == Schema Information
#
# Table name: artists
#
#  id               :integer          not null, primary key
#  artist_name      :string
#  aritst_name_kana :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Artist < ApplicationRecord
end
