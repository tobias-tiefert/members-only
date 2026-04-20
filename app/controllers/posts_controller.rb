class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  allow_unauthenticated_access
  # only: %i[ index ]
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @posts = Post.new
  end

  def edit
  end

  def create
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
