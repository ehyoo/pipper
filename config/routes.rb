Rails.application.routes.draw do
  ########### Note ###########
  # resource vs resources:
  # There can be many users, but you 
  # can only have one session in the browser
  ############################
  resource :session, only: [:new, :create, :destroy]
  resources :pips, only: [:show, :create, :destroy]
  resources :users
  resources :favorites
  resource :static_pages

  root 'static_pages#index'
end
