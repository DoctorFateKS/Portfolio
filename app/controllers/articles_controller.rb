class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @articles = Article.order(:title).limit(5)
  end

  def show
    @article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Article not found."
    redirect_to articles_path
  end

  def new
    @article = Article.new
  end
end
