class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def showluther
   #  @article = Article.find(params[:id])
   # @user = User.find_by_id(params[:user_id])
   # @articles = Article.all
  end

   def showstephanie
   # @article = Article.find(params[:id])
    # @user = User.find_by_id(params[:user_id])
    # @articles = Article.all
  end

  def showdelani

  end

  def index
     @articles = Article.all
     @articles = @current_user.article
    #@articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = "Memorie Was Succesfully Created"
      redirect_to articles_path(@article)
  else
    render 'new'
  end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Memory was Succesfully updated"
      redirect_to articles_path(@article)
    else
      render 'edit'
    end
  end

  def show
    #  @article = Article.find(params[:id])
    # @user = User.find_by_id(params[:user_id])
    # @articles = Article.all
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = "Memory was Succesfully deleted"
    redirect_to articles_path(@article)
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, :clip, :reply, images:[])
  end

  def require_same_user
    if current_user != @article.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own articles"
      redirect_to root_path
  end
 end
end
