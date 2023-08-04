class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes, foreign_key: 'user_id'
  has_many :foods, foreign_key: 'user_id'

  def shopping_list
    # Get all the recipe foods for the current user's recipes
    recipe_foods = RecipeFood.joins(:recipe).where(recipes: { user_id: self.id })

    # Group the recipe foods by their associated food items and calculate the total quantity required for each food item
    required_foods = recipe_foods.group(:food_id).sum(:quantity)

    # Create a hash to store the shopping list
    shopping_list = {}

    # Compare the total quantity of each food item required with the available quantity in the user's foods
    required_foods.each do |food_id, total_quantity_required|
      food = Food.find(food_id)
      available_quantity = food.quantity || 0
      quantity_to_buy = [0, total_quantity_required - available_quantity].max
      shopping_list[food] = quantity_to_buy if quantity_to_buy > 0
    end

    shopping_list
  end
end
