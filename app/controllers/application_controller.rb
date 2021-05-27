class ApplicationController < ActionController::Base

  before_action :authenticate_employee!,except: [:top]

  def after_sign_in_path_for(resource)
    employee_path(resource)
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :email,
      :name,
      :postcode,
      :prefecture_name,
      :address_city,
      :address_street,
      :address_building
    ])
  end
end
