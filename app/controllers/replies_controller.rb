class RepliesController < ApplicationController
    # before_action :require_admin, only:[:destroy]

  def create
    @article = Article.find(params[:article_id])
    @reply = @article.replies.create(params[:reply].permit(:name, :reply))
    redirect_to article_path(@article)
#else
#    render 'new'
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    flash[:danger] = "User and all articles created by user have been deleted"
    redirect_to articles_path
  end

  # def require_admin
  #   if logged_in? and !current_user.admin?
  #     flash[:dange] = "Only admin can user can perform that action"
  #     redirect_to articles_path
  #   end
  # end

end
