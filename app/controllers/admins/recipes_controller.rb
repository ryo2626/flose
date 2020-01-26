class Admins::RecipesController < ApplicationController
	before_action :nav_info, only: [:index, :edit]

	def index
    recipe = params[:q]
    @search = Recipe.ransack(recipe)
    @result = @search.result(distinct: true)
                     .page(params[:page]).per(10)
	end

  def edit
    @recipe = Recipe.find(params[:id])
    @user = @recipe.public_id
    @recipe.ingredients.build
    @recipe.cooks.build
  end

  def update
    recipe = Recipe.find(params[:id])
    cooks = params.dig(:recipe,:cooks_attributes)
  # Recipe.cooks.process_countに連番を振る
    cook_count = 1
      cooks.each do |p|
        p[1][:process_count] = cook_count
        cook_count += 1
      end
    recipe.update(recipe_params)
    redirect_to edit_admins_recipe_path
	end

	def destroy
    recipe = Recipe.find(params[:id])
    if recipe.destroy
      redirect_to admins_recipes_path
    else
      redirect_to admins_recipe_path(recipe)
    end
	end

private

  def recipe_params
    params.require(:recipe).permit(:public_id, :dish_name, :comment, :recipe_image,
      ingredients_attributes: [:id, :ingredient_name, :ingredient_amount, :_destroy],
      cooks_attributes:       [:id, :process_count, :process_text, :_destroy])
  end

  def nav_info
    @nav_info = Info.where(info_status: 0)
  end

end
