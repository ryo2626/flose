class Admins::CompaniesController < ApplicationController

	def index
		@nav_info = Info.where(info_status: 0)
		@company = Company.includes(:commodities).all
	end

	def edit
  end

	def update
	end

	def destroy
	end


end
