class Admin::CommentsController < ApplicationController

  def destroy
    comment = Comment.find(params[:id])
    if admin_signed_in?
      comment.destroy
      redirect_to board_post_path(comment.board_post.id)
    end
  end

end
