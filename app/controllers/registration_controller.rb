class RegistrationController < ApplicationController
  skip_before_action :check_current_user
  before_action :check_active_session

  def new; end

  def create; end
end
