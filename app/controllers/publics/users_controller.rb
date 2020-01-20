class Publics::UsersController < ApplicationController

  def show
  	@user = Public.find(params[:id])
  	@reserve = Reserve.where(public_id: @user.id)
  end

  def update
  	@user = Public.find(params[:id])
  	@user.update(user_params)
  	redirect_to publics_user_path(@user)
  end

  def destroy
  end

private
  def user_params
    params.require(:public).permit(:email, :lastname, :firstname, :lastname_kana, :firstname_kana, :phone, :postalcode, :address, :nickname)
  end
end
