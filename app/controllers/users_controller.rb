class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def index
    @user = User.all
    
  end

  # def update
  #   @user.update(user_params)
  #   redirect_to user_path(@user)
  # end

  # def destroy
  #   @user.destroy
  #   redirect_to users_path
  # end

  private

  def find_user
    @user = User.find_by(id: params[:id])
    redirect_to users_path if !@user
  end

  def user_params
    params.require(:user).permit(:user, :username, :password)
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @user ||= User.find_by_id(session[:user_id])
  end

  def verify
    if !logged_in?
      redirect_to users_path
    end
  end

end
