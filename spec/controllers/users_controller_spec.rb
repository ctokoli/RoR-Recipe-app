# spec/controllers/users_controller_spec.rb
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::Test::ControllerHelpers # Include Devise test helpers

  describe 'GET #index' do
    it 'renders the index template' do
      # Create a user with a unique email address
      user = create(:user)

      # Sign in the user
      sign_in user

      get :index

      expect(response).to render_template('index')
    end
  end
end
