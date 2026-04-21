class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :verify_user, only: %i[edit update destroy ]
  allow_unauthenticated_access only: %i[ index show ]
  def index
    @posts = Post.all.reverse
    @username = Current.user.username if authenticated?
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = Current.user.id

    if @post.save
      redirect_to @post
    else
      flash.now[:alert] = "Post couldn't be saved."
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      flash.now[:alert] = "Post couldn't be saved."
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

    def verify_user
      redirect_to posts_path unless authenticated? && @post.user == Current.user
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.expect(post: %i[title text user_id])
    end
end
