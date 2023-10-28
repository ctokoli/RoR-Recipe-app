class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :foods, foreign_key: :user_id
  has_many :recipes, foreign_key: :user_id

  validates :name, presence: true

  # def missing_foods
  #   user_foods = self.foods
  #   recipe_foods = RecipeFood.joins(:recipe).where(recipes: { user_id: self.id }).map(&:food)
  #   reamin = user_foods - recipe_foods
  # end
end
