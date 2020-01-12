class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?

def after_sign_in_path_for(resource)
  case resource
  when Public
    publics_user_path(resource.id)
  when Company
    companies_user_path(resource.id)
  when Admin
    admins_public_path
  end
end

def after_sign_up_path_for(resource)
  case resource
  when Public
    publics_user_path(resource.id)
  when Company
    companies_user_path(resource.id)
  when Admin
    admins_public_path
  end
end
	  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname, :firstname, :lastname_kana, :firstname_kana, :postalcode, :address, :phone, :nickname, :profit_price, :company_name])
  end

end
