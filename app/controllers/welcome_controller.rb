class WelcomeController < ApplicationController

def initial

end

def home

end

def stephanie
  @articles = Article.all
end

def luther
@articles = Article.all
end

def delani
    @articles = Article.all
 end

def cole
  @articles = Article.all
end

# def show
#   @article = Article.find(params[:id])
#  @user = User.find_by_id(params[:user_id])
#  @articles = Article.all
# end

end
