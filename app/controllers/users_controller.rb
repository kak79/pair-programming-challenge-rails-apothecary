class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:username_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
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
    params.require(:user).permit(:username, :password)
  end

end
