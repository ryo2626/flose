# frozen_string_literal: true

class Companies::SessionsController < Devise::SessionsController

  before_action :public_user

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def public_user
    if public_signed_in?
      redirect_to publics_user_path(current_public)
    end
  end

end
