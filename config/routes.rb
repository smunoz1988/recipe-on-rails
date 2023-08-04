Rails.application.routes.draw do
  devise_for :users
  resources :home, only: [:index]
  resources :users do
    resources :foods
    resources :recipes do
      member do
        patch 'toggle'
      end
    end
    resources :public_recipes
    resources :recipe_foods
  end
  root 'home#index'
end
