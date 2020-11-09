module ApplicationHelper

  def verify
    if !logged_in?
      redirect_to users_path
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @user ||= User.find_by_id(session[:user_id])
  end

  def find_user
    @user = User.find_by(id: params[:id])
    redirect_to users_path if !@user
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
