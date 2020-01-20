class Admins::CommoditiesController < ApplicationController
	before_action :nav_info, only: [:index, :edit]
	before_action :commodity, only: [:destroy, :edit, :update]

	def index
		@commodity = Commodity.includes(:company).all
	end

	def edit
	end

	def update
		@commodity.save
	end

	def destroy
		@commodity.destroy
	end

private

  def nav_info
    @nav_info = Info.where(info_status: 0)
  end

  def commodity
    @commodity = Commodity.find(params[:id])
  end
end
