class CartsController < ApplicationController
  before_action :set_cart_item, only: [:add_item,:update_item]

  def show
    @cart_items = current_user.cart.cart_items
    @total_price = 0

    @cart_items.each do |cart_item|
      @total_price += cart_item.item.price * cart_item.quantity
    end
  end

  def add_item
    @cart_item = current_user.cart.cart_items.build(cart_item_params) if @cart_item.nil?
    # binding pry
    # paramsメソッドの型は全て文字列なので、integerに変換
    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to cart_path(current_user.cart)
  end

  def update_item
    @cart_item.update(set_cart_item)
    redirect_to cart_path(current_user.cart)
  end

  def delete_item
    @cart_item = current_user.cart.cart_items.find_by(item_id: params[:item_id])
    @cart_item.destroy
    redirect_to cart_path(current_user.cart)
  end

  def delete_all
    CartItem.where(cart_id: params[:cart_id]).delete_all
    redirect_to items_path
  end

  private
    def set_cart_item
      # find_byで持ってくることによって存在しなかった場合に例外としない
      @cart_item = current_user.cart.cart_items.find_by(item_id: params[:cart_item][:item_id])
    end

    def cart_item_params
      # form_forで送られてくるparamsは二重のハッシュなので、[モデル名][カラム名]
      params.require(:cart_item).permit(:cart_id, :quantity).merge(item_id: params[:cart_item][:item_id])
    end
end
