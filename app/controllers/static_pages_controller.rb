class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed_items.page(params[:page]).per(15).includes(:user).order(created_at: :desc)
    end
  end
end
