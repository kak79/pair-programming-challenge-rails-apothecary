class SessionsController < ApplicationController

  module application_helper

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

end
