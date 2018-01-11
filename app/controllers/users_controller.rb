class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update,:correct_user]
  before_action :authenticate_user!
  before_action :correct_user,except: [:new,:orderlists]

  def new
    cart = current_user.create_cart
    cart.save
    redirect_to root_path
  end

  def show
  end


  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def orderlists
  end

  private
  def set_user
  	@user = User.find(params[:id])
  end

  def correct_user
    redirect_to user_path(current_user) unless current_user == @user
  end

  def user_params
    params.require(:user).permit(:email,:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :postal_code, :address, :tel_num)
  end
end
