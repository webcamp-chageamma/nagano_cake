class ApplicationController < ActionController::Base
  before_action :authenticate_admin!,except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
        when Customer
            root_path
        when Admin
            root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
        when Customer
            root_path
        when Admin
            admin_session_path
    end
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :phone_number, :address])
  end
end
