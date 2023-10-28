require 'rails_helper'

RSpec.feature 'Recipe Index Page', type: :feature do
  let(:user) { create(:user) }

  before do
    # You may need to set up any necessary data, such as recipes, before the test
    @recipe1 = create(:recipe, name: 'Recipe 1', user:)
    @recipe2 = create(:recipe, name: 'Recipe 2', user:)
    login_as(user, scope: :user)
  end

  scenario 'displaying recipes' do
    visit recipes_path

    expect(page).to have_content('Recipes') # Check for the heading
    expect(page).to have_link('Add New Recipe') # Check for the "Add New Recipe" link

    # Check that each recipe is displayed
    expect(page).to have_content(@recipe1.name)
    expect(page).to have_content(@recipe2.name)

    # Check for recipe attributes
    expect(page).to have_content(@recipe1.description)
    expect(page).to have_content("Preparation Time: #{@recipe1.preparation_time} minutes")
    expect(page).to have_content("Cooking Time: #{@recipe1.cooking_time} minutes")

    # Ensure the "REMOVE" button is present for each recipe
    expect(page).to have_button('REMOVE', count: 2)

    # You can also check other expectations based on your view template
  end
end
