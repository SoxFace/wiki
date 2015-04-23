class ArticlesController < ApplicationController

  before_action :find_article, only: [:show, :edit, :destroy]

  def index
    @articles = Article.all.order('created_at DESC')
  end

  def show
  end

  def new
    @article = current_user.articles.build #Article.new
  end

  def create
    @article = current_user.articles.build(article_params) # Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
