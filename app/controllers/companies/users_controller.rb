class Companies::UsersController < ApplicationController

  def show
    @user = Company.find(params[:id])
    @commodity = Commodity.where(company_id: @user.id)
  end

  def update
    @user = Company.find(params[:id])
    @user.update(user_params)
    redirect_to companies_user_path(@user)
  end

  def destroy
    @user = Company.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

private

  def user_params
    params.require(:company).permit(:email, :company_name, :phone, :postalcode, :address)
  end

end
