class CartsController < ApplicationController
  before_action :set_cart_item, only: [:delete_item]

  def show
    @cart_items = current_user.cart.cart_items
    # @cart_items = CartItem.includes(cart: :user).all
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.item.price * cart_item.quantity
    end
  end

  def add_item
    if user_blacklist?(current_user)
      redirect_blacklist(current_user)
    else
      @cart_item = current_user.cart.cart_items.build(cart_item_params) if @cart_item.nil?
      @item = @cart_item.item
      stock = @item.stock
      if stock.presence && (params[:cart_item][:quantity].to_i <= stock.quantity)
        # paramsメソッドの型は全て文字列なので、integerに変換
        @cart_item.save
      redirect_to cart_path(current_user.cart)
      else
        flash[:alert] = "在庫がありません"
        redirect_to item_path(@item)
      end
    end
  end

  def update_item
    if user_blacklist?(current_user)
      redirect_blacklist(current_user)
    else
      @cart_item = current_user.cart.cart_items.find_by(item_id: params[:cart_item][:item_id])
      # @cart_item = CartItem.includes(cart: :user).find_by(item_id: params[:cart_item][:item_id])
      @item = @cart_item.item
      stock = @item.stock
      if stock.presence && (params[:cart_item][:quantity].to_i <= stock.quantity)
        @cart_item.update(cart_item_params)
        redirect_to cart_path(current_user.cart)
      else
        flash[:alert] = "在庫がありません"
        redirect_to cart_path(current_user)
      end
    end
  end

  def delete_item
    @cart_item.destroy
    redirect_to cart_path(params[:item_id])
  end

  def delete_all
    CartItem.where(cart_id: params[:cart_id]).delete_all
    redirect_to items_path
  end

  private

    def set_cart_item
      # find_byで持ってくることによって存在しなかった場合に例外としない
      @cart_item = current_user.cart.cart_items.find_by(item_id: params[:item_id])
    end

    def cart_item_params
      # form_forで送られてくるparamsは二重のハッシュなので、[モデル名][カラム名]
      params.require(:cart_item).permit(:cart_id, :quantity).merge(item_id: params[:cart_item][:item_id])
    end
end
