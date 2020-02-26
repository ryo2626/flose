class Companies::UsersController < ApplicationController
  before_action :authenticate_company!
  before_action :correct_user

  def show
    @user = Company.find(params[:id])
    @commodity = Commodity.where(company_id: @user.id)
  end

  def update
    user = Company.find(params[:id])
    if user.update(user_params)
      flash[:notice] = '変更が保存されました。'
      redirect_to companies_user_path(user)
    else
      @user = Company.find(params[:id])
      @commodity = Commodity.where(company_id: @user.id)
      flash.now[:error] = '変更を保存できませんでした。'
      render :show
    end
  end

  def destroy
    user = Company.find(params[:id])
    user.destroy
    redirect_to root_path
  end

private

  def user_params
    params.require(:company).permit(:company_id, :email, :company_name, :phone, :postalcode, :address)
  end

  def correct_user
    user = Company.find(params[:id])
    unless user == current_company
      redirect_to companies_user_path(current_company)
    end
  end

end
