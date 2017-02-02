# Comments Controller - handles actions relating to Comments on Posts
class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to @comment.post, notice: 'Comment was successfully created.'
    else
      @post = @comment.post
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :body)
  end
end
