class PublicRecipesController < ApplicationController
  skip_before_action :authenticate_user! # , only: [:index]
  def index
    @public_recipes = Recipe.includes(:user).where(public: true).order(created_at: :desc)
  end
end
