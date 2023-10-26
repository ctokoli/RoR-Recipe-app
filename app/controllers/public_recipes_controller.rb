class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.where(public: true)
    @public_recipes.each do |recipe|
      @food_recipe = recipe.recipe_foods
    end

    # @food_recipe.each do |food|
    #   puts food.food.inspect
    #  end
  end
end
