require 'rails_helper'

RSpec.feature 'Public Recipes Page', type: :feature do
  scenario 'all users can see public recipes' do
    user = create(:user)
    login_as(user, scope: :user)
    recipe = create(:recipe, user:)
    visit public_recipes_path
    expect(page).to have_content(recipe.name)
  end
end
