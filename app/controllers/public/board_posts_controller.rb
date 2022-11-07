class Public::BoardPostsController < ApplicationController

  def index
    @board_posts = BoardPost.all
  end

  def new
    @board_post = BoardPost.new
  end

  def create
    @board_post = BoardPost.new(board_post_params)
    @board_post.customer_id = current_customer.id
    binding.pry
    @board_post.save
    redirect_to board_posts_path
  end

  def show
  end

  private

  def board_post_params
    params.require(:board_post).permit(:customer_id, :large_category_id, :board_title, :board_text)
  end

end
