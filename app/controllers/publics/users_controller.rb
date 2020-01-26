class Publics::UsersController < ApplicationController

  def show
  	@user = Public.find(params[:id])
  	reserve = Reserve.where(public_id: @user.id)
    @reserve = reserve.eager_load(:commodity)
                      .where(Commodity.arel_table[:limit].gt(Time.now))
    @reserve_d = reserve.eager_load(:commodity)
                        .where(Commodity.arel_table[:limit].lt(Time.now))
                        .page(params[:page]).per(20)
  end

  def update
  	@user = Public.find(params[:id])
  	@user.update(user_params)
  	redirect_to publics_user_path(@user)
  end

  def destroy
    @user = Public.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

private
  def user_params
    params.require(:public).permit(:email, :lastname, :firstname, :lastname_kana, :firstname_kana, :phone, :postalcode, :address, :nickname)
  end
end
