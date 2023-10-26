Rails.application.routes.draw do
  devise_for :users
  root 'food#index'

  resources :food, only: [:index, :new, :create, :destroy] do
    resources :recipe, only: [:index, :new, :create]
  end

  resources :shopping_lists, only: [:index] 
  resources :public_recipes, only: [:index]
  
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy, :update] do
    resources :recipe_foods, only: [:show, :new, :create, :destroy]
  end
  
  resources :users, only: [:index, :show, :new, :create, :destroy]

end
