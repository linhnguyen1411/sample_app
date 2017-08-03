class StaticPagesController < ApplicationController
  def home
    return unless logged_in?
    @followers = current_user.followers.size
    @following = current_user.following.size
    @micropost  = current_user.microposts.build
    # @feed_items = Micropost.feed(current_user).paginate(page: params[:page])
    @feed_items = Micropost.feed(current_user).paginate(page: params[:page])
  end

  def help; end

  def about; end

  def contact; end
end
