Rails.application.routes.draw do
  resources :automobiles, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  root controller: :automobiles, action: :index
  devise_for :users
  resources :users, only: [:show]

  # Custom non RESTful routes
  get :get_models, controller: :automobiles, action: :get_models
end
