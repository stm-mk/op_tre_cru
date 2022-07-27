class Api::ProfileController < ApplicationController
  before_action :authenticate!

  def update
    user = User.find(current_user.id)
    character_list = params[:user][:user_characters]
    character_list = [] if character_list === [""]
    if user.update(user_params)
      user.save_user(character_list)
      render json: user, methods: [:avatar_url]
    else
      render json: user.errors, status: :bad_request, each_serializer: UserSerializer
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :level, :game_id, :play_style, :avatar)
  end
end