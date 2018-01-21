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
  enum status: {reception:0, deposit_wait:1, in_preparing:2, sent:3}
	# enum status: {受付:0, 入金待ち:1, 商品準備中:2, 発送済み:3}
  enum payment: {bank_transfer:0, credit_card:1, pay_at_store:2}
	# enum payment: {銀行振込:0, クレジットカード:1, 店頭支払:2}
  enum deliver: {home_delivery:0, mail_delivery:1, receiving_at_a_convenience:2, over_the_counter_receives:3}
	# enum deliver: {宅配便:0, メール便:1, コンビニ受取:2, 店頭受取:3}

  has_many :order_items
  # has_many :items, through: :order_items
  belongs_to :user
  # accepts_nested_attributes_for :items
  # class << self
  # statusesメソッドでカラムのステータスとその値全てを取得可能
  #   def localed_statuses
  #     statuses.keys.map do |s|
  #       [ApplicationController.helpers.t("status.order.#{s}"), s]
  #     end
  #   end
  # end

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :tel_num, presence: true
  validates :total_price, presence: true
  validates :deliver, presence: true
  validates :payment, presence: true

end






