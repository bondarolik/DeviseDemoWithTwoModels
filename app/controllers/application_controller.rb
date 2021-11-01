class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!
  # before_action :authenticate_admin!

  helper_method :output_debug

  def after_sign_in_path_for(resource)
    if current_admin.present?
      backoffice_root_path
    else
      dashboard_path
    end
  end

  # Public helper methods
  #### Simplify output for debug variables in rails console
  def output_debug(params)
    Rails.logger.debug("\n\n\n\n------------------------------------------------\n")
    Rails.logger.debug(params.inspect)
    Rails.logger.debug("\n------------------------------------------------\n\n\n\n")
  end

  protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  # en
end
