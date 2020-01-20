class Admins::InfoController < ApplicationController
	before_action :nav_info, only: [:index, :edit]

	def index
		@infos = Info.all
	end

	def edit
		@info = Info.find(params[:id])
	end

	def update
		@info = Info.find(params[:id])
		@info.info_status = 1
		@info.save
		redirect_to admins_info_index_path
	end

	def destroy
	end

private

  def nav_info
    @nav_info = Info.where(info_status: 0)
  end
end