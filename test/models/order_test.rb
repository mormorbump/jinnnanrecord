# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  last_name       :string
#  first_name      :string
#  last_name_kana  :string
#  first_name_kana :string
#  postal_code     :string
#  address         :string
#  tel_num         :string
#  total_price     :integer
#  deliver         :integer
#  payment         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
