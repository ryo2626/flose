class Admins::PublicsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @nav_info = Info.where(info_status: 0)
    public = params[:q]
    @search = Public.with_deleted.ransack(public)
    @result = @search.result(distinct: true)
                     .without_deleted
                     .page(params[:page]).per(20)
    @result_d = @search.result(distinct: true)
                       .only_deleted
                       .page(params[:page]).per(20)
  end

  def edit
    @nav_info = Info.where(info_status: 0)
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
  	@user = Public.with_deleted.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = '変更が保存されました'
  	  redirect_to edit_admins_public_path(user)
    else
      @nav_info = Info.where(info_status: 0)
      @user = Public.includes(:recipes)
                  .with_deleted
                  .find(params[:id])
      @reserve = Reserve.includes(:commodity)
                  .where(public_id: @user.id)
                  .page(params[:page]).per(10)
      @recipes = @user.recipes
                    .page(params[:page]).per(10)
      flash.now[:error] = '変更が保存されませんでした'
      render :edit
    end
  end

  def destroy
    user = Public.with_deleted.find(params[:id])
    if user.deleted?
      user.restore
      flash[:notice] = 'アカウント凍結が解除されました。'
      redirect_to admins_publics_path
    else
      user.destroy
      flash[:error] = 'アカウントが凍結されました。'
      redirect_to admins_publics_path
    end
  end

private

	def user_params
    params.require(:public).permit(:email, :lastname, :firstname, :lastname_kana, :firstname_kana, :phone, :postalcode, :address, :nickname)
	end

end
