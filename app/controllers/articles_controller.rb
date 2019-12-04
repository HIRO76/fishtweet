class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit]
  before_action :move_to_index, except: :index

  def index
    @articles = Article.limit(10).order(created_at: :desc)
    @article = Article.limit(1).order(created_at: :desc)
  end

  def show
    # @article = Article.find(params[:id])
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    # @article = Article.create(title: article_params[:title], description: article_params[:description], body: article_params[:body], images: article_params[images: []])
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render "new"
    end
  end

  private 

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, :body, images: []).merge(user_id: current_user.id)
  end
end
