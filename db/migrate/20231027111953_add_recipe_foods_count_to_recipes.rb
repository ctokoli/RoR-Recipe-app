class AddRecipeFoodsCountToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :recipe_foods_count, :integer
  end
end
