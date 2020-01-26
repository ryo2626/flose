class Admins::CommoditiesController < ApplicationController
	before_action :nav_info, only: [:index, :edit]

	def index
		commodity = params[:q]
		@search = Commodity.ransack(commodity)
    @result = @search.result(distinct: true).includes(:company).page(params[:page]).per(10)
	end

	def edit
		@commodity = Commodity.find(params[:id])
	end

	def update
		commodity = Commodity.find(params[:id])
		commodity.update(commodity_params)
		redirect_to edit_admins_commodity_path(commodity)
	end

	def destroy
		commodity = Commodity.find(params[:id])
		if commodity.destroy
			redirect_to admins_commodities_path
		else
			redirect_to admins_commodity_path(commodity)
		end
	end

private

  def commodity_params
    params.require(:commodity).permit(:company_id, :commodity_name, :comment, :commodity_image, :regular_price, :sale_price, :quantity, :limit, :commodity_category)
  end

  def nav_info
    @nav_info = Info.where(info_status: 0)
  end

end
