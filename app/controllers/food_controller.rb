class FoodController < ApplicationController
  def index
    @user = current_user
    @foods = @user.foods
  end

  def new
    @food = Food.new
  end

  def create
    @user = current_user
    @food = Food.new(create_param)
    @food.user = @user
    if @food.save
      flash[:notice] = 'Food was successfully created.'
      redirect_to food_index_path
    else
      flash.now[:error] = 'Oops, something went wrong'
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.recipe_foods.destroy_all
    @food.destroy
    flash[:notice] = 'Food was successfully deleted.'
    redirect_to food_index_path
  end

  def create_param
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
