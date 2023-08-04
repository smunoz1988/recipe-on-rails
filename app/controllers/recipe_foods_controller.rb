class RecipeFoodsController < ApplicationController
  def new
    @foods = current_user.foods.pluck(:name, :id)
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(post_params)
    if @recipe_food.save
      redirect_to user_recipes_path
    else
      render :new
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to user_recipes_path(:recipe_id)
  end

  def post_params
    params.require(:recipe_food).permit(:quantity, :food_id, :recipe_id)
  end
end
