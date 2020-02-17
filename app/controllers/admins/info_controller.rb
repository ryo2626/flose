class Admins::InfoController < ApplicationController
	before_action :authenticate_admin!

	def index
		@nav_info = Info.where(info_status: 0)
										.page(params[:page]).per(20)
		@infos = Info.where(info_status: 1)
								 .order(created_at: :desc)
								 .page(params[:page]).per(20)
	end

	def edit
		@nav_info = Info.where(info_status: 0)
		@info = Info.find(params[:id])
	end

	def update
		info = Info.find(params[:id])
		info.info_status = 1
		if info.save
			flash[:notice] = '更新されました。'
			redirect_to edit_admins_info_path(info)
		else
			flash[:error] = '更新できませんでした。'
			redirect_to edit_admins_info_path(info)
		end
	end

end