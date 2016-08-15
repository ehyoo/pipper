Rails.application.routes.draw do
  get 'password_resets/new'

  resource :session, only: [:new, :create, :destroy]
  resources :pips, only: [:show, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy]
  resources :follows, only: [:create, :destroy, :show]
  resource :index_pages, only: [:index]
  resources :password_resets

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get 'join' => 'users#new'

  root 'index_pages#index'
end
