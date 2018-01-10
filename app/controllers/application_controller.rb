class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resoruce)
      # レシーバーが、引数のモデルに属するインスタンスかどうか判定
    if resource.is_a?(User)
    "/"
    end
  end
  protected

    def configure_permitted_parameters
    added_attrs = [:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :postal_code, :address, :tel_num]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end
end
