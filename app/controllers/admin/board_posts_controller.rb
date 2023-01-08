class Admin::BoardPostsController < ApplicationController

  def destroy
    @board_post = BoardPost.find(params[:id])
    if admin_signed_in?
      @board_post.destroy
      redirect_to board_posts_path
    end
  end

end
