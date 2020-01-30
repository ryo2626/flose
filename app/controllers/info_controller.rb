class InfoController < ApplicationController
  def top
  end

  def new
  	@info = Info.new
  end

  def create
  	@info = Info.new(info_params)
  	if @info.save
      flash[:notice] = '投稿しました。'
  		redirect_to root_path
  	else
      flash[:error] = '投稿できませんでした。'
      render action: :new
  	end
  end

  def about
  end

private

  def info_params
    params.require(:info).permit(:user_status, :public_id, :company_id, :contributor, :contributor_email, :info_status, :info_content)
  end
end
