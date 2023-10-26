class ShoppingListController < ApplicationController
  def index
    @recipes = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipes.recipe_foods
  end
end
