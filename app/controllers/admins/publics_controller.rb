class Admins::PublicsController < ApplicationController
  def index
  	@nav_info = Info.where(info_status: 0)
  	@user = Public.all
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
