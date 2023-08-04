class HomeController < ApplicationController
  def index
    @shopping_list = current_user.shopping_list
  end
end
