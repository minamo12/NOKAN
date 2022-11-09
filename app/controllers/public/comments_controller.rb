class Public::CommentsController < ApplicationController

  def index
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.customer_id = current_customer.id
    binding.pry
    @comment.save
    redirect_to board_post_path(@comment.board_post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:customer_id, :board_post_id, :comment_text)
  end
end
