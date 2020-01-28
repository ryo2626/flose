class Publics::LikesController < ApplicationController
	before_action :set_variables

  def like
    like = current_public.likes.new(recipe_id: @recipe.id)
    like.save
  end

  def unlike
    like = current_public.likes.find_by(recipe_id: @recipe.id)
    like.destroy
  end

  private

  def set_variables
    @recipe = Recipe.find(params[:recipe_id])
    @id_name = "#like-link-#{@recipe.id}"
  end
end
