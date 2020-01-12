class Publics::RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @ingredients = @recipe.ingredients.build
    @cooks = @recipe.cooks.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to publics_recipes_path
    else
      render new_publics_recipe_path
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
def recipe_params
  params.require(:recipe).permit(:dish_name, :comment, :recipe_image, ingredients_attributes: [:id, :ingredient_name, :ingredient_amount, :_destroy], cooks_attributes: [:id, :process_count, :process_count, :process_text, :_destroy])
end

end
