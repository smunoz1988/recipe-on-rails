class RecipeFoodsController < ApplicationController
  def new
    @foods = current_user.foods.pluck(:name, :id)
    @recipe_food = RecipeFood.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @recipe_food = RecipeFood.new(post_params)
    if @recipe_food.save
      redirect_to user_recipe_path(user_id: current_user.id, id: @recipe_food.recipe_id)
    else
      render :new
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to user_recipe_path(user_id: current_user.id, id: @recipe_food.recipe_id)
  end

  def post_params
    params.require(:recipe_food).permit(:quantity, :food_id, :recipe_id)
  end
end
