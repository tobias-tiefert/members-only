class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  allow_unauthenticated_access only: %i[ index show ]
  def index
    @posts = Post.all
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
  end

  def destroy
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.expect(post: %i[title text])
    end
end
