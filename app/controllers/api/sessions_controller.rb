class Api::SessionsController < ApplicationController
  def create
    user = User.authenticate(params[:email], params[:password])

    if user
      token = user.create_tokens

      render json: { token: token }
    else
      # 401エラーを返す
      head :unauthorized
    end
  end
end
