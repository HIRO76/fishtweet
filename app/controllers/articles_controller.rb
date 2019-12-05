class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit]
  before_action :move_to_index, except: [:index, :show]

  helper_method :images_destroy


  def index
    @articles = Article.limit(10).order(created_at: :desc)
  end

  def show
  end

  def edit
    @images = @article.images
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else 
      render "edit"
    end
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

  def destroy
  end


  # def images_destroy
  #   # params[:album][:image_ids].each do |image_id|
  #   #   image = @album.images.find(image_id)
  #   #   image.purge
  #   # end
  #   @images = @article.images
  #   @images.purge
  # end

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
