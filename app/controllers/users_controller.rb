class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :require_same_user, only:[:edit, :update, :destroy]
  before_action :require_admin, only:[:destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to our journey on Making Memories By The Mile #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    #@user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:dange] = "User and all articles created by user have been deleted"
    redirect_to users_path
  end

  def update
  end

  def show
      @article = Article.find(params[:id])
      @user = User.find_by_id(params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger] = "you can only edit your own account"
      redirect_to root_path
    end
  end

  def require_admin
    if logged_in? and !current_user.admin?
      flash[:dange] = "Only admin can user can perform that action"
      redirect_to root_path
    end
  end

end
