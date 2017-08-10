class SessionsController < ApplicationController
  before_action :load_user, only: :create
  def new; end

  def create
    if @user && @user.authenticate(params[:session][:password])
      check_activated
      log_in @user
      params[:session][:remember_me] == "1" ? remember(@user) : forget(@user)
      # remember(@user)
      redirect_back_or @user
    else
      flash.now[:danger] = t "error.login_fail"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end

  def check_activated
    if @user.activated?
      log_in @user
      params[:session][:remember_me] == Settings.a ? remember(@user) : forget(@user)
      redirect_back_or @user
    else
      message = t("message.acc_not_activated")
      flash[:warning] = message
      redirect_to root_url
    end
  end

  def load_user
    @user = User.find_by email: params[:session][:email].downcase
    return if @user
    flash[:danger] = t "danger.user_invalid"
    redirect_to login_path
  end
end
