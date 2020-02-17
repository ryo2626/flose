class Admins::RecipesController < ApplicationController
  before_action :authenticate_admin!

	def index
    @nav_info = Info.where(info_status: 0)
    recipe = params[:q]
    @search = Recipe.ransack(recipe)
    @result = @search.result(distinct: true)
                     .page(params[:page]).per(20)
	end

  def edit
    @nav_info = Info.where(info_status: 0)
    @recipe = Recipe.find(params[:id])
    @user = @recipe.public_id
    @recipe.ingredients.build
    @recipe.cooks.build
  end

  def update
    @recipe = Recipe.find(params[:id])
    cooks = params.dig(:recipe,:cooks_attributes)
  # Recipe.cooks.process_countに連番を振る
    cook_count = 1
      cooks.each do |p|
        p[1][:process_count] = cook_count
        cook_count += 1
      end
    if recipe.update(recipe_params)
      flash[:notice] = '変更が保存されました。'
      redirect_to edit_admins_recipe_path
    else
      @nav_info = Info.where(info_status: 0)
      @recipe = Recipe.find(params[:id])
      @user = @recipe.public_id
      @recipe.ingredients.build
      @recipe.cooks.build
      flash.now[:error] = '変更をを保存できませんでした。'
      render :edit
    end
	end

	def destroy
    recipe = Recipe.find(params[:id])
    if recipe.destroy
      flash[:error] = 'レシピが削除されました。'
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

end
