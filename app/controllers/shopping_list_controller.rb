class ShoppingListController < ApplicationController
  skip_before_action :authenticate_user! # , only: [:index]
  def index
    @recipes = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipes.recipe_foods
  end
end
