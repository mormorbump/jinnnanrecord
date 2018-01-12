class ItemsController < ApplicationController

  def index
      @items = Item.order(id: :desc).page(params[:page]).per(5)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = current_user.cart.cart_items.build
  end
end
