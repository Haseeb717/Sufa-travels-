class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u| u.permit(:name, :email, :password, :password_confirmation) end
    devise_parameter_sanitizer.for(:account_update) do |u| u.permit(:image,:name,:email, :password, :password_confirmation, :current_password) end
  end

  def after_sign_in_path_for(resource)
    if current_user.user?
      root_path
    elsif current_user.admin?
      list_all_users_homes_path
    elsif current_user.super_admin?
      super_admin_dashboard_homes_path
    elsif current_user.ceo?
      ceo_monthly_report_homes_path
    end
  end
end
