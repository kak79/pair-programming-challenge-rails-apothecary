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

  post "/registration/signup" do
  #check if the email name combo exists -- done
  #should the email be made lowercase --- stretch feature
  #name cannot contain numbers, periods, etc -- done
   #should it be forced to initial cap? --- some people have odd names
  # need to fully railize this !!!
  if @user = User.find_by(username: params[:username]).nil? && User.find_by(username: params[:username]).nil?
    @username = User.new(name: params[:name], email: params[:email], password: params[:password])
    # binding.pry
    if @username.save
      session[:username_id] = @username.id
      redirect user_path(@username)
    end
  end
  render :"/users/new"
end

post login do
  @username = User.find_by(username: params[:username])
  if @username && @username.authenticate(params[:password])
    session[:username_id] = @username.id
    redirect # users/:id
  end
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
