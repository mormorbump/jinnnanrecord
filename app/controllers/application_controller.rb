class ApplicationController < ActionController::Base
  include ApplicationHelper
  # view_context.helper_methodでもいける
  protect_from_forgery with: :exception
  # before_action :set_cart
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action  :store_location

# 直前にアクセスしていたurlをsessionに保存。redirect_to session[:previous_url]でいつでも呼び出せる。
  def store_location
    if (request.fullpath != "/users/sign_in" &&
        request.fullpath != "/users/sign_up" &&
        # 正規表現の元となっているRegexpクラスのインスタンスを生成。引数に正規表現を記入
        request.fullpath !~ Regexp.new("\\A/users/password.*\\z") &&
        !request.xhr?)
      session[:previous_url] = request.fullpath
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
  end
