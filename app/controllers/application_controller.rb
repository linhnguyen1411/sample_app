# top level comment
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def hello
    render html: "Hello, World!"
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  # Confirms a logged-in user.
  def logged_in_user
    if logged_in?
      flash[:success] = I18n.t("success.welcome")
    else
      store_location
      flash[:danger] = t("error.login")
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to(root_url) unless current_user?(@user)
  end
end
