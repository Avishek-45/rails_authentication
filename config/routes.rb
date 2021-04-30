Rails.application.routes.draw do
  root "sessions#welcome"
  resources :users, only: [:new, :create ,:show]
  resources :sessions
  resources :posts
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
end
