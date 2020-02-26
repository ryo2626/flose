class Companies::CommoditiesController < ApplicationController
  before_action :authenticate_company!

  def new
    @commodity = Commodity.new
  end

  def create
  	commodity = Commodity.new(commodity_params)
  	if commodity.save
      flash[:notice] = '商品が作成されました。'
  	  redirect_to companies_user_path(current_company)
    else
      flash.now[:error] = '商品を作成できませんでした。'
      render :new
    end
  end

  def show
  	@commodity = Commodity.find(params[:id])
    unless @commodity.company == current_company
      redirect_to companies_user_path(current_company)
    end
  	@user = Reserve.where(commodity_id: @commodity.id)
  end

private

  def commodity_params
    params.require(:commodity).permit(:company_id, :commodity_name, :comment, :commodity_image, :regular_price, :sale_price, :quantity, :limit, :commodity_category)
  end

end
