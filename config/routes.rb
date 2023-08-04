Rails.application.routes.draw do
  devise_for :users
  resources :home, only: [:index]
  resources :users do
    resources :foods
    resources :recipes do
      member do
        patch 'toggle'
      end
      resources :recipe_foods
    end
    resources :public_recipes
  end
  root 'home#index'
end
