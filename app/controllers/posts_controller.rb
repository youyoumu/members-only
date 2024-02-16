class PostsController < ApplicationController
  before_action :require_sign_in, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def require_sign_in
    unless user_signed_in?
      authenticate_user!
    else

    end
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
