Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :users
  resources :likes
  root 'posts#index'
end
