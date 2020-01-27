class Admins::CommoditiesController < ApplicationController
	before_action :authenticate_admin!
	before_action :nav_info, only: [:index, :edit]

	def index
		@nav_info = Info.where(info_status: 0)
		commodity = params[:q]
		@search = Commodity.ransack(commodity)
    @result = @search.result(distinct: true).includes(:company).page(params[:page]).per(10)
	end

	def edit
		@nav_info = Info.where(info_status: 0)
		@commodity = Commodity.find(params[:id])
	end

	def update
		@commodity = Commodity.find(params[:id])
		if @commodity.update(commodity_params)
			flash[:notice] = '変更が保存されました。'
			redirect_to edit_admins_commodity_path(commodity)
		else
			@nav_info = Info.where(info_status: 0)
			flash[:error] = '変更できませんでした。'
			render :edit
		end
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

end
