Rails.application.routes.draw do
  # devise_for :users
  
  resources :users do
    resources :foods
    resources :recipes
  root 'users#index'
end
