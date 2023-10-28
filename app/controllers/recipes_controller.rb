class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def index
    @user = current_user
    @recipes = @user.recipes.includes(:user)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods.includes(:food)
  end

  def new
    @recipe = Recipe.new
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(public: !@recipe.public)
      redirect_to @recipe, notice: 'Recipe public status was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.recipe_foods.destroy_all
    @recipe.destroy
    flash[:notice] = 'Recipe was successfully deleted.'
    redirect_to recipes_path
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
