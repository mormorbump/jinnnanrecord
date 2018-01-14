class OrdersController < ApplicationController
  def new
    @order = Order.new
    @cart_items = current_user.cart.cart_items
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.item.price * cart_item.quantity
    end
  end

  def create
    Order.create(order_params)
    @cart_items = cart_items_params.each do |id, cart_item_param|
      cart_item = CartItem.find(id)
      cart_item.update_attributes(cart_item_param)
      cart_item
    end
    redirect_to orderlists_user_path(current_user)
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



