class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin_auth
    unless current_user.user_group.to_s == '0' && !current_user.nil?
      redirect_to root_path
    end
  end

  def validate_content
    unless current_user.id.to_s == params[:id].to_s
      flash[:notice] = "Mozesz edytowac tylko swojego uzytkownika"
      redirect_to root_path
    end
  end
end