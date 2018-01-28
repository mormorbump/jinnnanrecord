# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
    # if current_user.cart.blank?
    #     cart = Cart.new
    #     cart.user_id = current_user.id
    #     cart.save
    # end
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  def destroy
    if params[:user][:retire_flag]
      @user.update(user_params)
      @user.soft_destroy!
      Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
      set_flash_message(:notice, :destroyed)
      yield resource if block_given?
      respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
    else
      respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
    end
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end
  def user_params
    params.require(:user).permit(:retire_flag)
  end

  def after_sign_up_path_for(resoruce)
      # レシーバーが、引数のモデルに属するインスタンスかどうか判定
    if resource.is_a?(User)
     new_user_path
    end
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
