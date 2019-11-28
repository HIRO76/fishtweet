class ArticlesController < ApplicationController
  # before_action :set_article, only: [:show, :edit]

  def index
    # @articles = Article.all
  end

  def show
  end

  def edit
  end

  def new
    # @article = Article.new
  end

  def create
    Article.create(title: article_params[:title], description: article_params[:description], body: article_params[:body], images: article_params[:images])
    redirect_to @article
  end

  private 

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, :body, images: [])
  end
end
