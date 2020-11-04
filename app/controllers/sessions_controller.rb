class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    byebug
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:username_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
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
