class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resoruce)
      # レシーバーが、引数のモデルに属するインスタンスかどうか判定
    if resource.is_a?(User)
     new_user_path
    end
  end

  protected

    def configure_permitted_parameters
      added_attrs = [
        :last_name,
        :first_name,
        :last_name_kana,
        :first_name_kana,
        :nickname,
        :postal_code,
        :address,
        :tel_num
      ]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    end

    def set_cart
      if current_user.presence && current_user.cart.blank?
        cart = Cart.new
        cart.user_id = current_user.id
        cart.save
      end
    end
end
