class ApplicationController < ActionController::API
  include Authenticable
  helper_method :current_user

  def current_user
    session[:user_info]
  end
end
