class ApplicationController < ActionController::Base

  before_action :authenticate_employee!,except: [:top]

  def after_sign_in_path_for(resource)
    employee_path(resource)
  end

end
