Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  root 'food#index'

  resources :food, only: [:index, :new, :create, :destroy] do
    resources :recipe, only: [:index, :new, :create]
  end

  resources :shopping_list, only: [:index] 
  resources :public_recipes, only: [:index]
  

  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy, :update] do
    resources :recipe_foods, only: [:show, :new, :create, :destroy]
  end

  resources :users, only: [:index, :show, :new, :create, :destroy]

end
end