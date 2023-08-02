class FoodsController < ApplicationController
  def index
    @user = User.includes(:foods).find(params[:user_id])
  end
end
