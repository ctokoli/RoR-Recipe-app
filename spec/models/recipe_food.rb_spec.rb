require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  it 'is valid with valid attributes' do
    food = Food.create(name: 'Test Food', measurement_unit: 'Grams', price: 10.99, quantity: 500)
    recipe = Recipe.create(name: 'Test Recipe', user: User.create(email: 'test@example.com', password: 'password'))

    recipe_food = RecipeFood.new(quantity: 100, food:, recipe:)

    expect(recipe_food).to be_valid
  end

  it 'is associated with a food' do
    food = Food.create(name: 'Test Food', measurement_unit: 'Grams', price: 10.99, quantity: 500)
    recipe = Recipe.create(name: 'Test Recipe', user: User.create(email: 'test@example.com', password: 'password'))

    recipe_food = RecipeFood.create(quantity: 100, food:, recipe:)

    expect(recipe_food.food).to eq(food)
  end

  it 'is associated with a recipe' do
    food = Food.create(name: 'Test Food', measurement_unit: 'Grams', price: 10.99, quantity: 500)
    recipe = Recipe.create(name: 'Test Recipe', user: User.create(email: 'test@example.com', password: 'password'))

    recipe_food = RecipeFood.create(quantity: 100, food:, recipe:)

    expect(recipe_food.recipe).to eq(recipe)
  end
end
