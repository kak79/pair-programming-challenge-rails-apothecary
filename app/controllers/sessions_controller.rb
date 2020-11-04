class SessionsController < ApplicationController

  def login
    @user = User.new
  end

  def post_login
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:username_id] = @user.id
      redirect_to user_path(@user)
    else
      @user ||= User.new
      render :login
    end
  end

  def logout
    session.destroy
    redirect_to login_path
  end

  private

  def logged_in?
    !!current_user
  end

  def current_user
    @user ||= User.find_by_id(session[:user_id])
  end

  def verify
    if !logged_in?
      redirect_to users_path
    end
  end

  def sesison_params
  params.require(:user).permit(:username, :password)
end

end
