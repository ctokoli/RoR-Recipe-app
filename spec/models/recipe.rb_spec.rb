require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(email: 'test@example.com', password: 'password')
    recipe = Recipe.new(
      name: 'Example Recipe',
      description: 'This is a test recipe',
      preparation_time: 30,
      cooking_time: 60,
      user:
    )
    expect(recipe).to be_valid
  end

  it 'is not valid without a name' do
    recipe = Recipe.new(name: nil)
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a description' do
    recipe = Recipe.new(description: nil)
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a preparation time' do
    recipe = Recipe.new(preparation_time: nil)
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a cooking time' do
    recipe = Recipe.new(cooking_time: nil)
    expect(recipe).to_not be_valid
  end

  it 'is associated with a user' do
    user = User.create(email: 'test@example.com', password: 'password')
    recipe = Recipe.new(
      name: 'Example Recipe',
      description: 'This is a test recipe',
      preparation_time: 30,
      cooking_time: 60,
      user:
    )
    expect(recipe.user).to eq(user)
  end
end
