Rails.application.routes.draw do
  resources :keywords
  resources :posts
  resources :groups
  get 'home/index'
  # devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'home#index'

  #API routes
  namespace :api do
    namespace :v1 do
      resources :groups, only: [:index, :show] 
      resources :posts, only: [:index, :show] 
      resources :keywords
    end
  end

end
