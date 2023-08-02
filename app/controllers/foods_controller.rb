class FoodsController < ApplicationController
  def index
    @user = User.includes(:foods).find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id]) 
    @food = Food.new
  end

  def create
    @user = current_user
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to user_foods_path
  end
end
