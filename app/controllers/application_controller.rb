class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_the_sign_in_path_for(resoruce)
    redirect_to users_path,method: :post
  end
end
