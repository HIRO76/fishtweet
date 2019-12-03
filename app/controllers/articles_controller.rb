class ArticlesController < ApplicationController
  # before_action :set_article, only: [:show, :edit]

  def index
    @articles = Article.limit(5).order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    # @article = Article.create(title: article_params[:title], description: article_params[:description], body: article_params[:body], images: article_params[images: []])
    @article = Article.new(article_params)
    @article.user_id = 1
    if @article.save
      redirect_to @article
    else
      render "new"
    end
  end

  # def top_image(image)
  #   # @top_image.article.images.variant(resize: "150x150").processed, class: "article-list-img"
  #   image = article.images.limit(1)
  # end

  private 

  # def set_article
  #   @article = Article.find(params[:id])
  # end

  def article_params
    params.require(:article).permit(:title, :description, :body, images: [])
  end
end
