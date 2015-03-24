Rails.application.routes.draw do
  root to: 'home#index'
  resources :goals do
    resources :goal_histories
  end
  resources :users
  match 'login', to: 'users#login', via: :get
  match 'login', to: 'users#do_login', via: :post
  match 'logout', to: 'users#logout', via: :get

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  get "/auth/:provider/callback" => "users#login_facebook", as: :auth_callback
end
