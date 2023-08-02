class FoodsController < ApplicationController
  def index
    @user = User.includes(:foods).find(params[:user_id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(post_params)
    @food.user_id = current_user.id
    if @food.save
      redirect_to user_foods_path
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to user_foods_path
  end

  def post_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
