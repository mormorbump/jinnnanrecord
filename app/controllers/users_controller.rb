class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :correct_user, :retire, :orderlists]
  before_action :authenticate_user!, except: :new
  before_action :correct_user,except: :new

  def new
    cart = current_user.create_cart unless current_user.cart.presence
    redirect_to controller: 'items', action: 'index'
  end

  def show
  end

  def edit
  end

  def update
    if params[:user][:retire_flag]
      @user.update(user_params)
      @user.soft_destroy!
      Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
      yield resource if block_given?
      # respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
    else
      @user.update(user_params)
      redirect_to user_path(@user)
    end
  end

  def orderlists
    order_items = []
    current_user.orders.each do |order|
      order.order_items.each do |order_item|
        order_items << order_item
      end
    end

    @total_price = 0
    order_items.each do |order_item|
      @total_price += order_item.sub_total_price
    end

    order_items = order_items.reverse
    @order_items = Kaminari.paginate_array(order_items).page(params[:page]).per(5)
  end

  def retire
  end

  # def retire_destroy
  #   @user.update(user_params)
  #   @controller_name = "users/sessions"
  #   @action_name: "destroy"
  #   @params: { id: params[:id] }
  #   render: :retire_destroy
  # end

  private

    def set_user
    	@user = User.find(params[:id])
    end

    def correct_user
      redirect_to user_path(current_user) unless current_user == @user
    end

    def user_params
      params.require(:user).permit(
        :email,
        :last_name,
        :first_name,
        :last_name_kana,
        :first_name_kana,
        :nickname,
        :postal_code,
        :address,
        :tel_num,
        :retire_flag,
        :retire_reason,
        :blacklist_flag
        )
    end
end
