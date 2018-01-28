class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :cart
  has_many :orders
  has_many :reviews

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
  validates :postal_code, numericality: {only_integer: true}
  validates :address, presence: true
  validates :tel_num, presence: true
  validates :tel_num, numericality: {only_integer: true}

  enum retire_reason: {bad_item:0, high_price:1, anuse_ability:2}

  # kakurenbo-putiによる論理削除用のカラム
  soft_deletable

  # Deviseを使うと、問答無用でemailがユニーク扱いになる。
  # それだと論理削除した際に再登録できないので、一旦emailに関する検証を削除する
  # https://gist.github.com/brenes/4503386
  _validators.delete(:email)
  _validate_callbacks.each do |callback|
    if callback.raw_filter.respond_to? :attributes
      callback.raw_filter.attributes.delete :email
    end
  end

  # emailのバリデーションを定義し直す
  validates :email, presence: true
  validates_format_of :email, with: Devise.email_regexp, if: :email_changed?
  validates_uniqueness_of :email, scope: :soft_destroyed_at, if: :email_changed?

  def self.find_for_authentication(warden_conditions)
    without_soft_destroyed.where(email: warden_conditions[:email]).first
  end

  def cart_item_exists?(item, cart)
    cart_items = CartItem.where(cart_id: cart.id)
    cart_items.find_by(item_id: item.id).presence
  end

end
