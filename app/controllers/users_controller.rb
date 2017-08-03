class UsersController < ApplicationController
  before_action :logged_in_user, only: %I[edit update index]
  before_action :correct_user, only: %I[edit update]
  before_action :admin_user, only: :destroy
  before_action :load_user, only: %I[edit update]
  def show
    @user = User.find_by id: params[:id]
    if @user.blank?
      flash.now[:danger] = t "error.user_not_vaild"
      redirect_to signup_path
    else
      flash.now[:success] = t "static_pages.new.fl_success"
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = t "info.check_mail"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "success.profile_updated"
      redirect_to @user
      # Handle a successful update.
    else
      render :edit
    end
  end

  def destroy
    User.find_by(params[:id]).destroy
    flash[:success] = t "success.user_deleted"
    redirect_to users_url
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user.blank?
    redirect_to login_path
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
