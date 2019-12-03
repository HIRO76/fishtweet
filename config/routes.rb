Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :articles do
    resources :comments, only: :create
  end
  root to: 'articles#index'
end
