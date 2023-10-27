require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(email: 'test@example.com', password: 'password')
    food = Food.new(
      name: 'Example Food',
      measurement_unit: 'Grams',
      price: 10.99,
      quantity: 500,
      user:
    )
    expect(food).to be_valid
  end

  it 'is not valid without a name' do
    food = Food.new(name: nil)
    expect(food).to_not be_valid
  end

  it 'is not valid without a measurement unit' do
    food = Food.new(measurement_unit: nil)
    expect(food).to_not be_valid
  end

  it 'is not valid without a price' do
    food = Food.new(price: nil)
    expect(food).to_not be_valid
  end

  it 'is not valid without a quantity' do
    food = Food.new(quantity: nil)
    expect(food).to_not be_valid
  end

  it 'is associated with a user' do
    user = User.create(email: 'test@example.com', password: 'password')
    food = Food.new(
      name: 'Example Food',
      measurement_unit: 'Grams',
      price: 10.99,
      quantity: 500,
      user:
    )
    expect(food.user).to eq(user)
  end
end
