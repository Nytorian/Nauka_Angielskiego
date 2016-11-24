class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin_auth
    if current_user
      unless current_user.user_group.to_s != '1'
        redirect_to root_path
      end
    else
      redirect_to login_path
    end
  end
end
