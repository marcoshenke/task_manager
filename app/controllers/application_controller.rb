class ApplicationController < ActionController::Base
  before_action :set_default_response_format
  protect_from_forgery with: :null_session

  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[name email password])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name email])
  end

  def set_default_response_format
    request.format = :json
  end
end
