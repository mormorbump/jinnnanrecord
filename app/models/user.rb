class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :cart
  has_many :orders
  has_many :reviews
  
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

   def cart_item_exists?(item,cart)
    cart_items = CartItem.where(cart_id: cart.id)
    cart_items.find_by(item_id: item.id).presence
   end

end
