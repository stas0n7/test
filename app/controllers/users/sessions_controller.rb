module Users
  class SessionsController < ApplicationController
    skip_before_action :check_current_user, only: %i[new create]
    before_action :check_active_session, only: %i[new create]

    def new; end

    def create
      @user = User.find_by(email: params[:email])
      if @user.present? && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to dashboard_path
      else
        flash.now[:error] = 'Invalid Credentials'
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to sign_in_path
    end
  end
end
