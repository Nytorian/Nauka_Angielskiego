class SessionsController < ApplicationController

  def new
  end

  def create
    #raise params.inspect
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Successfully logged in!"
    else
      @notice = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
