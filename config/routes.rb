Rails.application.routes.draw do
  resources :automobiles, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  root controller: :automobiles, action: :index
  devise_for :users
  resources :users, only: [:show]
  resources :rentals, only: [:new, :create]
end
