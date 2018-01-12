class ItemsController < ApplicationController

  def index
      @items_count = Item.all.count
      @items = Item.order(id: :desc).page(params[:page]).per(10)
      @cart_item = current_user.cart.cart_items.build
      @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = current_user.cart.cart_items.build
  end
end
