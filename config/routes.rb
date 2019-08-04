Rails.application.routes.draw do
  root  'blogs#index'
  devise_for :users
  resources :users, only: [:show, :destroy]
  resources :blogs
end
