class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    if @user.blank?
      flash[:danger] = I18n.t("error.user_not_vaild")
      redirect_to signup_path
    else
      flash[:success] = I18n.t("static_pages.new.fl_success")
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = I18n.t("static_pages.new.fl_success")
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
