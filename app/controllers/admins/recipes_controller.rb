class Admins::RecipesController < ApplicationController
	before_action :nav_info, only: [:index, :edit]

	def index
		@recipe = Recipe.all
	end

	def edit
		@recipe = Recipe.find(params[:id])
	end

	def update
	end

	def destroy
	end

private

  def nav_info
    @nav_info = Info.where(info_status: 0)
  end

end
