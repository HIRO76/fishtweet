class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit]

  def index
    # @articles = Article.new
  end

  def show
  end

  def edit
  end

  def create
  end

  private 

  def set_article
    @article = Article.find(params[:id])
  end
end
