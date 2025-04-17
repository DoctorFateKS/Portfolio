class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @articles = Article.order(:title).limit(5)
  end
end
