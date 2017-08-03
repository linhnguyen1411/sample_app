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

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end

  private

  # Confirms a logged-in user.
  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "danger.login"
    redirect_to login_url
  end
end
