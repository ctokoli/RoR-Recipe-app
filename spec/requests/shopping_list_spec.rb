require 'rails_helper'

RSpec.feature 'Shopping List Page', type: :feature do
  let(:recipe) { create(:recipe) }

  before do
    @recipe_food1 = create(:recipe_food, recipe: recipe)
    @recipe_food2 = create(:recipe_food, recipe: recipe)
  end
end