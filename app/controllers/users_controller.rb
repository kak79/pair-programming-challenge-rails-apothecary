class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit]

  def new
    @user = User.new
  end

  def create
    if @user = User.find_by(username: params[:username]).nil? && User.find_by(username: params[:username]).nil?
      @username = User.new(user_params)
      if @username.save
        session[:username_id] = @username.id
        redirect_to user_path(@username)
      end
    end
    render :new
  end

  def index
    @user = User.all
  end

 

  private

  def find_user
    @user = User.find_by(id: params[:id])
    redirect_to users_path if !@user
  end

  def user_params
    params.require(:user).permit(:user, :username, :password)
  end

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

  def logout!
    session.clear
  end

end
