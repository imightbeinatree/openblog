# Posts Controller - actions relating to creating, editing, and displaying posts
class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  before_action :set_post_from_current_user_pool, only: [:edit, :update]
  before_action :authenticate_user!, only: [:my, :new, :create, :edit, :update]

  def index
    @posts = Post.latest.page params[:page]
  end

  def my
    @posts = current_user.posts.latest.page params[:page]
  end

  def show
    @comment = Comment.new(post_id: @post.id)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_post_from_current_user_pool
    # intentionally raising a 404 if you request a post from another user
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
