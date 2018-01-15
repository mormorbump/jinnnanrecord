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
#  status          :integer
#

class Order < ApplicationRecord
	belongs_to :user
	enum status: {受付:0, 入金待ち:1, 商品準備中:2, 発送済み:3}
	enum payment: {銀行振込:0, クレジットカード:1, 店頭支払:2}
	enum deliver: {宅配便:0, メール便:1, コンビニ受取:2, 店頭受取:3}
end
