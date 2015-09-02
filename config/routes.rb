Rails.application.routes.draw do
  root to: 'home#index'
  resources :goals

  resources :users
  match 'login', to: 'users#login', via: :get
  match 'login', to: 'users#do_login', via: :post
  match 'logout', to: 'users#logout', via: :get

  match 'history', to: 'goals#create_history', via: :post

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  get '/auth/:provider/callback' => 'users#oauth_login'
end
