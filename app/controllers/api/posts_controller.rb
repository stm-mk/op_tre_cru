class Api::PostsController < ApplicationController
  before_action :authenticate!
  before_action :set_post, only: %i[show update destroy]

  def index
    @posts = Post.all
    render json: @posts, each_serializer: PostSerializer
  end

  def show
    render json: @post, each_serializer: PostSerializer
  end

  def create
    @post = current_user.build_post(post_params)

    if @post.save
      render json: @post, each_serializer: PostSerializer
    else
      render json: @post.errors, status: :bad_request
    end
  end

  def update
    if @post.update(post_params)
      render json: @post, each_serializer: PostSerializer
    else
      render json: @post.errors, status: :bad_request
    end
  end

  def destroy
    @post.destroy!
    render json: @post
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :friend_level, :description)
  end
end
