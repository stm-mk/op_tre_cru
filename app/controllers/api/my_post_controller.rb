class Api::MyPostController < ApplicationController
  before_action :authenticate!

  def index
    @post = current_user.post
    render json: @post
  end
end
