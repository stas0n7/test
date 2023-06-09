module Users
  class AvatarsController < ApplicationController
    def create
      current_user.create_avatar(avatar_params)
    end

    private

    def avatar_params
      params.permit(:image)
    end
  end
end
