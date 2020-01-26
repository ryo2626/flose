class Admins::CompaniesController < ApplicationController
	before_action :nav_info, only: [:index, :edit]

	def index
		@nav_info = Info.where(info_status: 0)
		company = params[:q]
    @search = Company.with_deleted.ransack(company)
    @result = @search.result(distinct: true)
    									.without_deleted
    									.page(params[:page]).per(10)
    @result_d = @search.result(distinct: true)
    									 .only_deleted
    									 .page(params[:page]).per(10)
	end

	def edit
		@nav_info = Info.where(info_status: 0)
		@user = Company.includes(:commodities).with_deleted.find(params[:id])
  end

	def update
		@user = Company.with_deleted.find(params[:id])
    @user.update(user_params)
    redirect_to admins_companies_path(@user)
	end

	def destroy
		@user = Company.with_deleted.find(params[:id])
		if @user.deleted?
			@user.restore
			redirect_to admins_companies_path
		else
    	@user.destroy
    	redirect_to admins_companies_path
    end
	end


private

	def user_params
    params.require(:company).permit(:email, :company_name, :phone, :postalcode, :address)
  end

  def nav_info
    @nav_info = Info.where(info_status: 0)
  end
end
