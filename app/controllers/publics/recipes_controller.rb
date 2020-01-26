class Publics::RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @user = current_public.id
    @recipe.ingredients.build
    @recipe.cooks.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    # Recipe.cooks.process_countに連番を振る
    count = 0
      @recipe.cooks.each do |p|
        count += 1
        p.process_count = count
      end
    if @recipe.save
      redirect_to publics_recipes_path
    else
      render new_publics_recipe_path
    end
  end

  def index
    recipe = params[:q]
    @search = Recipe.ransack(recipe)
    @result = @search.result(distinct: true)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients.count
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @user = @recipe.public_id
    @recipe.ingredients.build
    @recipe.cooks.build
  end

  def update
    @recipe = Recipe.find(params[:id])
    @cooks = params.dig(:recipe,:cooks_attributes)
  # Recipe.cooks.process_countに連番を振る
    cook_count = 1
      @cooks.each do |p|
        p[1][:process_count] = cook_count
        cook_count += 1
      end
    @recipe.update(recipe_params)
    redirect_to publics_recipes_path
  end

  def destroy
  end

private
  def recipe_params
    params.require(:recipe).permit(:public_id, :dish_name, :comment, :recipe_image,
      ingredients_attributes: [:id, :ingredient_name, :ingredient_amount, :_destroy],
      cooks_attributes:       [:id, :process_count, :process_text, :_destroy])
  end

end
