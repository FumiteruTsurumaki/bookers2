Rails.application.routes.draw do
  root 'home#index'
  get "home/about"
  devise_for :users
  resources :books
  resources :users, only: [:index, :show, :edit, :update]
end
