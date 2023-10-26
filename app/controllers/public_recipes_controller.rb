class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.where(public: true).order(created_at: :desc)
    @public_recipes.each do |recipe|
     @food_recipe = recipe.recipe_foods
    end

    @food_recipe.each do |food|
      puts food.food.inspect
     end
    
  end 


end

#