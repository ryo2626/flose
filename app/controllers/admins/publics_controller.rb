class Admins::PublicsController < ApplicationController
  before_action :nav_info, only: [:index, :edit]

  def index
    public = params[:q]
    @search = Public.with_deleted.ransack(public)
    @result = @search.result(distinct: true)
                     .without_deleted
                     .page(params[:page]).per(10)
    @result_d = @search.result(distinct: true)
                       .only_deleted
                       .page(params[:page]).per(10)
  end

  def edit
  	@user = Public.includes(:recipes)
                  .with_deleted
                  .find(params[:id])
  	@reserve = Reserve.includes(:commodity)
                  .where(public_id: @user.id)
                  .page(params[:page]).per(10)
    @recipes = @user.recipes
                    .page(params[:page]).per(10)
  end

  def update
  	user = Public.with_deleted.find(params[:id])
  	user.update(user_params)
  	redirect_to edit_admins_public_path(user)
  end

  def destroy
    user = Public.with_deleted.find(params[:id])
    if user.deleted?
      user.restore
      redirect_to admins_publics_path
    else
      user.destroy
      redirect_to admins_publics_path
    end
  end

private

	def user_params
    params.require(:public).permit(:email, :lastname, :firstname, :lastname_kana, :firstname_kana, :phone, :postalcode, :address, :nickname)
	end
	def nav_info
    @nav_info = Info.where(info_status: 0)
  end

end
