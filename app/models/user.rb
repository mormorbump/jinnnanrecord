class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :cart
  has_many :orders
  has_many :reviews


  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :password, presence: true, length: { maximum: 255 }, allow_nil: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, 
             format: {
                        with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                        message: "全角カタカナのみで入力して下さい"
                    }
  validates :first_name_kana, presence: true, 
               format: {
                        with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                        message: "全角カタカナのみで入力して下さい"
                    }
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :tel_num, presence: true


  # enum blacklist_flag: {設定なし:0, ブラックリストユーザ:1}

   def cart_item_exists?(item, cart)
    cart_items = CartItem.where(cart_id: cart.id)
    cart_items.find_by(item_id: item.id).presence
   end
end
