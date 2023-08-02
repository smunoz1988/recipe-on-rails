class RecipesController < ApplicationController
  def index
    @user = User.includes(:foods, :recipes).find(params[:user_id])
  end
end
