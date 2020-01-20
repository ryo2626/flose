class Companies::CommoditiesController < ApplicationController

  def new
    @commodity = Commodity.new
  end

  def create
  	@commodity = Commodity.new(commodity_params)
  	@commodity.save
  	redirect_to companies_user_path(current_company)
  end

  def show
  	@commodity = Commodity.find(params[:id])
  	@user = Reserve.where(commodity_id: @commodity.id)
  end

  private

  def commodity_params
    params.require(:commodity).permit(:company_id, :commodity_name, :comment, :commodity_image, :regular_price, :sale_price, :quantity, :limit, :commodity_category)
  end
end
