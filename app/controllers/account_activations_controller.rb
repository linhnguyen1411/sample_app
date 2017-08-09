class AccountActivationsController < ApplicationController
  def edit
    @user = User.find_by(email: params[:email])
    if @user && !@user.activated? && @user.authenticated?(:activation, params[:id])
      @user.activate
      update
      flash[:success] = t "success.account_activated"
      redirect_to @user
    else
      flash[:danger] = t "danger.invalid_acc_link"
      redirect_to root_url
    end
  end

  def update
    @user.update_attributes activated: true
    @user.update_attributes activated_at: Time.zone.now
    log_in @user
  end
end
