class Publics::UsersController < ApplicationController
  before_action :authenticate_public!
  before_action :correct_user

  def show
  	@user = Public.find(params[:id])
  	reserve = Reserve.where(public_id: @user.id)
    @reserve = reserve.eager_load(:commodity)
                      .where(Commodity.arel_table[:limit].gt(Time.now))
    @reserve_d = reserve.eager_load(:commodity)
                        .where(Commodity.arel_table[:limit].lt(Time.now))
                        .order(created_at: :desc)
                        .page(params[:page]).per(20)
  end

  def update
  	@user = Public.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = '変更が保存されました。'
  	  redirect_to publics_user_path(@user)
    else
      reserve = Reserve.where(public_id: @user.id)
      @reserve = reserve.eager_load(:commodity)
                        .where(Commodity.arel_table[:limit].gt(Time.now))
      @reserve_d = reserve.eager_load(:commodity)
                          .where(Commodity.arel_table[:limit].lt(Time.now))
                          .order(created_at: :desc)
                          .page(params[:page]).per(20)
      flash.now[:error] = '変更を保存できませんでした。'
      render :show
    end
  end

  def destroy
    user = Public.find(params[:id])
    user.destroy
    redirect_to root_path
  end

private

  def user_params
    params.require(:public).permit(:email, :lastname, :firstname, :lastname_kana, :firstname_kana, :phone, :postalcode, :address, :nickname)
  end

  def correct_user
    user = Public.find(params[:id])
    unless user == current_public
      redirect_to publics_user_path(user)
    end
  end

end
