class Publics::ReservesController < ApplicationController
  before_action :authenticate_public!

  def shop
    @reserve = Reserve.new
    address = params[:q]
    @search = Company.ransack(address)
    @result = @search.result(distinct: true)
    @result = Commodity.where(company_id: @result)
                       .where(commodity_category: 0)
                       .where(Commodity.arel_table[:limit].gt(Time.now))
                       .where(Commodity.arel_table[:quantity].gt(0))
                       .order(created_at: :desc)
  end

  def restaurant
    @reserve = Reserve.new
    address = params[:q]
    @search = Company.ransack(address)
    @result = @search.result(distinct: true)
    @result = Commodity.where(company_id: @result)
                       .where(commodity_category: 1)
                       .where(Commodity.arel_table[:limit].gt(Time.now))
                       .where(Commodity.arel_table[:quantity].gt(0))
                       .order(created_at: :desc)
  end

  def create
  	reserve = Reserve.new(reserve_params)
  # 商品の残り数から１をひく
    commodity = Commodity.find(params[:reserve][:commodity_id])
    commodity.quantity -= 1
  # 商品の定価と販売価格の差をユーザーのお得金額に足す
    user = current_public
    user.profit_price = @user.profit_price.to_i + (@commodity.regular_price.to_i - @commodity.sale_price.to_i)
  # 各テーブル保存
    unless user.save
      flash[:error] = '予約できませんでした。'
      redirect_to publics_shop_path
    end
    unless commodity.save
      flash[:error] = '予約できませんでした。'
      redirect_to publics_shop_path
    end
    unless reserve.save
      flash[:error] = '予約できませんでした。'
      redirect_to publics_shop_path
    end
    flash[:notice] = '予約が確定されました。'
    redirect_to publics_user_path(current_public.id)
  end

private

  def reserve_params
    params.require(:reserve).permit(:commodity_id, :public_id)
  end

end
