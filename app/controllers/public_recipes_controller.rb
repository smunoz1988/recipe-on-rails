class PublicRecipesController < ApplicationController
    def index
    #  render all recipes and users names with a public status
    @public_recipes = Recipe.where(public: true)
end
