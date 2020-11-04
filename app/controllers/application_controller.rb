class ApplicationController < ActionController::Base

  def login
    @username = User.find_by(username: params[:username])
    if @username && @username.authenticate(params[:password])
      session[:username_id] = @username.id
      redirect_to user_path(@user)
    end
  end


end
