require 'sidekiq/web'
require 'sidekiq/cron/web'
Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    get 'about/index'
    devise_for :users, controllers: { registrations: 'users/registrations' }
    resources :posts
    resources :users
    resources :likes
    root 'posts#index'
  end
  mount Sidekiq::Web => '/sidekiq'
  namespace 'api' do
    namespace 'v1' do
      resources :login
    end
  end
end
