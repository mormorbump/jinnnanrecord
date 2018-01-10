class ItemsController < ApplicationController
  def index
    if current_user.presence
      unless current_user.cart.presence
        cart = Cart.new
        cart.user_id = current_user.id
        cart.save
      end
    end
      @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = current_user.cart.cart_items.build
  end
end
