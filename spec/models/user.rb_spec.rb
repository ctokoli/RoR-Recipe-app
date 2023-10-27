require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(
      email: 'test@example.com',
      password: 'password',
      name: 'John Doe'
    )
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user = User.new(password: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a name' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it 'has many foods' do
    user = User.new(email: 'test@example.com', password: 'password', name: 'John Doe')
    food1 = Food.new(name: 'Food 1', measurement_unit: 'Grams', price: 10.99, quantity: 500, user:)
    food2 = Food.new(name: 'Food 2', measurement_unit: 'Grams', price: 8.99, quantity: 300, user:)
    user.foods << food1
    user.foods << food2

    expect(user.foods).to include(food1, food2)
  end

  it 'has many recipes' do
    user = User.new(email: 'test@example.com', password: 'password', name: 'John Doe')
    recipe1 = Recipe.new(name: 'Recipe 1', description: 'Description 1', preparation_time: 30, cooking_time: 60,
                         user:)
    recipe2 = Recipe.new(name: 'Recipe 2', description: 'Description 2', preparation_time: 40, cooking_time: 50,
                         user:)
    user.recipes << recipe1
    user.recipes << recipe2

    expect(user.recipes).to include(recipe1, recipe2)
  end
end
