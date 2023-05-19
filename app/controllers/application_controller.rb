class ApplicationController < ActionController::Base
  helper_method :current_user

  before_action :check_current_user

  private

  def check_current_user
    redirect_to sign_in_path if current_user.blank?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def check_active_session
    redirect_to dashboard_path if current_user.present?
  end
end
