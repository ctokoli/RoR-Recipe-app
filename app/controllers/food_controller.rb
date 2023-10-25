class FoodController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new 
  end

  def create
    @user =  current_user
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
  
  def create_param
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
