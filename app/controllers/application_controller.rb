class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :setup_app
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def setup_app
    @app = App.new
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
