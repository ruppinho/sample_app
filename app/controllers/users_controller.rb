# Controller for user actions
class UsersController < ApplicationController
  before_action :require_user!, except: [:new, :create, :index]
  before_action :require_signed_in_user!, only: [:edit, :update, :index, :destroy, :following, :followers]
  before_action :require_correct_user!, only: [:edit, :update]
  before_action :require_admin_user!, only: [:destroy]

  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = 'Welcome to the Sample App!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = 'User deleted.'
    redirect_to users_url
  end

  def following
    @title = 'Following'
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = 'Followers'
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
