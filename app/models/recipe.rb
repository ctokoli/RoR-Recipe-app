class Recipe < ApplicationRecord
    belongs_to :user, class_name: "user", foreign_key: "user_id"
    has_many :recipe_foods, foreign_key: :recipe_id

    validates :name, presence: true
    validates :description, presence: true
    validates :preparation_time, presence: true
    validates :cooking_time, presence: true

end
