class Public::CommentsController < ApplicationController

  def my_comments
    @customer = current_customer
    @my_comments = @customer.comments
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.customer_id = current_customer.id
    @comment.save
    redirect_to board_post_path(@comment.board_post.id)
  end

  def destroy
    comment = Comment.find(params[:id])
    if current_customer.id == comment.customer.id
      comment.destroy
      redirect_to board_post_path(comment.board_post.id)
    else
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:customer_id, :board_post_id, :comment_text)
  end
end
