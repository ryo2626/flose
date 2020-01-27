class Publics::RecipesController < ApplicationController
  before_action :authenticate_public!
  before_action :post_user, only: [:edit, :update , :destroy]

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
      flash[:notice] = 'レシピが保存されました。'
      redirect_to publics_recipes_path
    else
      flash.now[:error] = 'レシピを保存できませんでした。'
      render new_publics_recipe_path
    end
  end

  def index
    recipe = params[:q]
    @search = Recipe.ransack(recipe)
    @result = @search.result(distinct: true).order(created_at: :desc)
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
    cooks = params.dig(:recipe,:cooks_attributes)
  # Recipe.cooks.process_countに連番を振る
    cook_count = 1
      cooks.each do |p|
        p[1][:process_count] = cook_count
        cook_count += 1
      end
    if @recipe.update(recipe_params)
      flash[:notice] = '編集が保存されました。'
      redirect_to publics_recipes_path
    else
      flash.now[:error] = '保存できませんでした。'
      render :edit
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    flash.now[:error] = 'レシピが削除されました。'
  end

private

  def recipe_params
    params.require(:recipe).permit(:public_id, :dish_name, :comment, :recipe_image,
      ingredients_attributes: [:id, :ingredient_name, :ingredient_amount, :_destroy],
      cooks_attributes:       [:id, :process_count, :process_text, :_destroy])
  end

  def post_user
    recipe = Recipe.find(params[:id])
    unless recipe.public == current_public
      redirect_to publics_recipes_path
    end
  end

end
