class CartsController < ApplicationController

  def add_item
    cart_item = CartItem.new(cart_item_params)
    cart_item.quantity += params[quantity]
    cart_item.save
    redirect_to cart_path(current_user.cart)
  end

  def show
  end

  def complete
  end

  def cart_item_params
    params.require(:cart_item).permit(:cart_id,:item_id,:quantity)
  end
end
