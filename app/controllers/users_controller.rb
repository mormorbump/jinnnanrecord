class UsersController < ApplicationController
	before_action :set_user, only: [:show, :new, :edit]

  def show
  end

  def create
    unless current_user.cart.presence
      cart = Cart.new
      cart.user_id = current_user.id
      cart.save
    end
    redirect_to items_path
  end

  def new
  end

  def edit
  end

  private
  def set_user
  	@user = User.find(params[:id])
  end
end
