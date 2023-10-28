require 'rails_helper'

RSpec.feature 'Food#index Page', type: :feature do
  scenario 'unauthorized user cannot add a new food' do
    user = create(:user)
    login_as(user, scope: :user)
    visit food_index_path
    expect(page).not_to have_button('Add food', exact: true)
  end

  scenario 'unauthorized user cannot delete food' do
    user = create(:user)
    login_as(user, scope: :user)
    visit food_index_path
    expect(page).not_to have_button('delete', exact: true)
  end

  scenario 'authorized user can delete their food' do
    user = create(:user)
    login_as(user, scope: :user)
    visit food_index_path
    expect(page).not_to have_button('Delete', exact: true)
  end
end
