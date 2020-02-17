class Admins::CommoditiesController < ApplicationController
	before_action :authenticate_admin!

	def index
		@nav_info = Info.where(info_status: 0)
		commodity = params[:q]
		@search = Commodity.ransack(commodity)
    @result = @search.result(distinct: true)
    								 .where(Commodity.arel_table[:limit].gt(Time.now))
    								 .includes(:company)
    								 .page(params[:page]).per(20)
    @result_d = @search.result(distinct: true)
    									 .where(Commodity.arel_table[:limit].lt(Time.now))
                       .includes(:company)
                       .page(params[:page]).per(20)
	end

	def edit
		@nav_info = Info.where(info_status: 0)
		@commodity = Commodity.includes(:company).find(params[:id])
	end

	def update
		commodity = Commodity.find(params[:id])
		if commodity.update(commodity_params)
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
