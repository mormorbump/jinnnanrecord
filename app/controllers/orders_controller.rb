class OrdersController < ApplicationController
  def new
    @order = Order.new
    @cart_items = current_user.cart.cart_items
    # 合計金額
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.item.price * cart_item.quantity
    end
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = []
    # 二重のハッシュ構造になってるストロングパラメータを繰り返し処理。

    cart_items_params.each do |id, cart_item_params|
      cart_item = CartItem.find(id)
      stock = cart_item.item.stock
      # binding pry
      if stock.presence && cart_item[:quantity].to_i <= stock.quantity
        cart_item.assign_attributes(cart_item_params)
        @cart_items << cart_item
      end
    end

    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.item.price * cart_item.quantity
    end
  end

  def create
    order = Order.new(order_params)

    cart_items = []
    cart_items_params.each do |id, cart_item_params|
      cart_item = CartItem.find(id)
      stock = cart_item.item.stock
      if stock.presence && cart_item[:quantity].to_i <= stock.quantity
        cart_item.update(cart_item_params)
        cart_items << cart_item
        stock.quantity -= cart_item[:quantity].to_i
        stock.save
      end
    end

    if order.save
      cart_items.each do |cart_item|
        order_item = order.order_items.build
        order_item.item_id = cart_item.item_id
        order_item.quantity = cart_item.quantity
        order_item.sub_total_price = cart_item.item.price * cart_item.quantity
        cart_item.destroy if order_item.save
      end
      redirect_to orderlists_user_path(current_user)
    else
      redirect_to new_order_path
    end
  end

  private
    def order_params
      params.permit(
        :last_name,
        :first_name,
        :last_name_kana,
        :first_name_kana,
        :postal_code,
        :address,
        :tel_num,
        :total_price,
        :deliver,
        :payment,
          ).merge(user_id: current_user.id)
    end

    def cart_items_params
      # fields_forで送られてきた二重ハッシュを展開
      # cart_items[:id]というキーの値がquantityというキーになっている。
      # だが、それを{cart_items => {} permitted: true}というハッシュが覆っているので展開。順序的に逆に見えるが、最初の丸括弧はただの引数なのでこれでおっけー
      params.permit(cart_items: [:quantity])[:cart_items]
    end
end

# params.permit[:cart_items]

# Unpermitted parameters: :utf8, :authenticity_token, :last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :tel_num, :deliver, :payment, :cart_items, :total_price, :commit

# => これだとcart_itemsがUnpermittedが展開できてない。理由は、ハッシュじゃないのに配列で開こうとしてるから。


# params.permit(cart_items: [:quantity])

# Unpermitted parameters: :utf8, :authenticity_token, :last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :tel_num, :deliver, :payment, :total_price, :commit

# => <ActionController::Parameters {"cart_items"=><ActionController::Parameters {"71"=><ActionController::Parameters {"quantity"=>"1111"} permitted: true>, "72"=><ActionController::Parameters {"quantity"=>"23"} permitted: true>} permitted: true>} permitted: true>

# => これはcart_items[:id]の指定、そしてその値（のkey）であるquantityは指定できてるが、外側のcart_items => {} permitted: trueが展開できてない。なので、idと[:quantity]が取り出せない。


# params.permit(cart_items: [:quantity])[:cart_items]

# Unpermitted parameters: :utf8, :authenticity_token, :last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :tel_num, :deliver, :payment, :total_price, :commit

# => <ActionController::Parameters {"71"=><ActionController::Parameters {"quantity"=>"1111"} permitted: true>, "72"=><ActionController::Parameters {"quantity"=>"23"} permitted: true>} permitted: true>




# <ActionController::Parameters
#  {
#   "utf8"=>"✓",
#   "authenticity_token"=>"5vIWXb757eOILbR8wHXs9L7KSmbBk8ONigRni4orW601uO7z/OF1Etk4oYOvcbr+Q2cWSQ8yQDoh2jhFk7glYQ==",
#   "last_name"=>"a",
#   "last_name_kana"=>"あ",
#   "first_name"=>"a",
#   "first_name_kana"=>"あ",
#   "postal_code"=>"1",
#   "address"=>"1",
#   "tel_num"=>"1",
#   "deliver"=>"0",
#   "payment"=>"0",
#   "cart_items"=>{
#     "71"=>{"quantity"=>"12"},
#     "72"=>{"quantity"=>"34"},
#     "73"=>{"quantity"=>"1"}
#     },
#   "total_price"=>"2262",
#   "commit"=>"注文を確定する",
#   "controller"=>"orders",
#   "action"=>"create"
# }
#   permitted: false>
