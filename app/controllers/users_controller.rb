class UsersController < ApplicationController

  include ApplicationHelper

  before_action :find_user, only: [:show, :edit]

  def new
    @user = User.new
  end

  def show
    if !logged_in?
      render :new
    end
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

end
