class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def show
    @microposts = @user.microposts
  end
  
  def new
    @user = User.new
  end
  
  def create
      @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def followings
    @title = "Followings"
    @user = User.find(params[:id])
    @users = @user.following_users
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.follower_users
    render 'show_follow'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :zone, :profile,
                                 :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end

  
end
