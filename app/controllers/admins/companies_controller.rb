class Admins::CompaniesController < ApplicationController
	before_action :authenticate_admin!

	def index
		@nav_info = Info.where(info_status: 0)
		company = params[:q]
    @search = Company.with_deleted.ransack(company)
    @result = @search.result(distinct: true)
    									.without_deleted
    									.page(params[:page]).per(20)
    @result_d = @search.result(distinct: true)
    									 .only_deleted
    									 .page(params[:page]).per(20)
	end

	def edit
		@nav_info = Info.where(info_status: 0)
		@user = Company.includes(:commodities)
									 .with_deleted.find(params[:id])
  end

	def update
		user = Company.with_deleted.find(params[:id])
    if user.update(user_params)
    	flash[:notice] = '変更が保存されました。'
    	redirect_to edit_admins_company_path(user)
  	else
  		@nav_info = Info.where(info_status: 0)
  		flash.now[:error] = '変更を保存できませんでした。'
  		render :edit
  	end
	end

	def destroy
		user = Company.with_deleted.find(params[:id])
		if user.deleted?
			user.restore
			flash[:notice] = 'アカウント凍結が解除されました。'
			redirect_to edit_admins_company_path(user)
		else
    	user.destroy
    	flash[:error] = 'アカウントが凍結されました。'
    	redirect_to edit_admins_company_path(user)
    end
	end


private

	def user_params
    params.require(:company).permit(:email, :company_name, :phone, :postalcode, :address)
  end

end
