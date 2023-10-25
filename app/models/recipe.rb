class Recipe < ApplicationRecord
  self.table_name = 'recipes'
  belongs_to :user
  has_many :recipe_foods, foreign_key: :recipe_id

  validates :name, presence: true
  validates :description, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
end
