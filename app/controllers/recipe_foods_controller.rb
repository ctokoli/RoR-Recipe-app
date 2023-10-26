class RecipeFoodsController < ApplicationController
  def index; end

  def new
    @recipe_food = RecipeFood.new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.all
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = RecipeFood.new(recipe_foods_params)
    @recipe_foods.recipe = @recipe
    if @recipe_foods.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def recipe_foods_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
