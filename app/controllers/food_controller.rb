class FoodController < ApplicationController
  def index; end

  def create
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
  end
end
