class UsersController < ApplicationController
  before_action :load_user, only:
  %I[show edit update followers following]
  before_action :logged_in_user, only:
    %I[edit update index destroy following followers]
  before_action :correct_user, only: %I[edit update]
  before_action :admin_user, only: :destroy
  def show
    @microposts = @user.microposts.paginate(page: params[:page])
    return if @user.present?
    flash.now[:danger] = t "error.user_not_vaild"
    redirect_to signup_path
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
      flash[:info] = t "info.check_email"
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

  def following
    @title = t "static_pages.title.following"
    @users = @user.following.paginate(page: params[:page])
    render :show_follow
  end

  def followers
    @title = t "static_pages.title.follower"
    @users = @user.followers.paginate(page: params[:page])
    render :show_follow
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    redirect_to root_url
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
