class UsersController < ApplicationController
  def show
    @articles = Article.where(user_id: current_user.id).order(created_at: :desc).limit(10)
  end

  def edit
  end
end
