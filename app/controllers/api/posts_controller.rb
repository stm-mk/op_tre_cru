class Api::PostsController < ApplicationController
  before_action :authenticate!, only: %i[create update destroy]
  before_action :set_post, only: %i[show update destroy]

  def index
    @posts = Post.order(updated_at: :desc)
    render json: @posts, each_serializer: PostSerializer
  end

  def show
    render json: @post, each_serializer: PostSerializer
  end

  def create
    @post = current_user.build_post(post_params)
    tag_list = params[:post][:post_tags]
    if @post.save
      @post.save_posts(tag_list)
      render json: @post, each_serializer: PostSerializer
    else
      render json: @post.errors, status: :bad_request
    end
  end

  def update
    if @post.update(post_params)
      tag_list = params[:post][:post_tags]
      @post.save_posts(tag_list)
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
