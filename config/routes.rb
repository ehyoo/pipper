Rails.application.routes.draw do
  ########### Note ###########
  # resource vs resources:
  # There can be many users, but you 
  # can only have one session in the browser
  ############################
  resource :session, only: [:new, :create, :destroy]
  resources :users

  root :to => 'users#index'
end
