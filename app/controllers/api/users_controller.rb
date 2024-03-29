class Api::UsersController < ApplicationController
  before_action :authenticate!, only: %i[me]

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors, status: :bad_request
    end
  end

  # ログインユーザー情報を返すエンドポイント
  def me
    render json: current_user, methods: [:avatar_url], each_serializer: UserSerializer
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :game_id, :level, :play_style, :avatar)
  end
end
