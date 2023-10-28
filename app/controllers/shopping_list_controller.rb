class ShoppingListController < ApplicationController
  skip_before_action :authenticate_user! # , only: [:index]
  def index
    @recipes = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipes.recipe_foods
    @remaining_foods_price = remaining_foods_price
    @missing_foods = missing
  end

  def remaining_foods_price
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

  def missing
    @user = current_user # Assuming you have a way to get the logged-in user
    foods = @user.foods
    recipe_foods = @recipes.recipe_foods
    missing_foods = []
    recipe_foods.each do |recipe_food|
      foods.each do |food|
        missing_foods << food if recipe_food.food == food
      end
    end
    foods - missing_foods
  end
end
