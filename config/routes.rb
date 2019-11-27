Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/show'
  get 'comments/edit'
  get 'articles/index'
  get 'articles/show'
  get 'articles/edit'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
