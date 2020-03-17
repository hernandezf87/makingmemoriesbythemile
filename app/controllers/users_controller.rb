class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :require_same_user, only:[:edit, :update, :destroy]
  before_action :require_admin, only:[:destroy]

  def index
    # @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id?
      redirect_to home_path
    else
      render 'new'
    end
  end

  def edit
    #@user = User.find(params[:id])
  end

  def update
  end

  def show
    @user_articles = @user.articles
      @articles = Article.find(params[:articles_id])
      @articles = Article.all
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:dange] = "User and all articles created by user have been deleted"
    redirect_to home_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :id)
    redirect_to home_path
  end


  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger] = "you can only edit your own account"
      redirect_to home_path
    end
  end
end
