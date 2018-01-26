module ApplicationHelper
  def authenticate_cart(user)
    redirect_to session[:previous_url] || root_path unless user.cart.cart_items.presence
  end

  def user_blacklist?(user)
    user.blacklist_flag ? true : false
  end

  def redirect_blacklist(user)
    redirect_to session[:previous_url] || root_path if user.blacklist_flag = true
  end

  # こっからdeviseの設定をinclude

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
