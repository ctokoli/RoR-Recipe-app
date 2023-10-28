class ShoppingListController < ApplicationController
  skip_before_action :authenticate_user! # , only: [:index]
  def index
    @recipes = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipes.recipe_foods
    @remaining_foods = remaining_foods
  end

  def remaining_foods
    total_foods = current_user.foods
    total_recipe_foods_price = 0
    total_foods_price = 0
    total_foods.each do |food|
      total_foods_price += food.price
    end
    @recipe_foods.each do |recipe_food|
      total_recipe_foods_price += recipe_food.food.price
    end
    total_foods_price - total_recipe_foods_price
  end
end
