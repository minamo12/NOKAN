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
    @board_post.save
    redirect_to board_posts_path
  end

  def show
    @board_post = BoardPost.find(params[:id])
  end

  def my_posts
    @customer = current_customer
    @my_posts = @customer.board_posts
  end

  def destroy
    @board_post = BoardPost.find(params[:id])
    @board_post.destroy
    redirect_to customers_my_page_path
  end

  private

  def board_post_params
    params.require(:board_post).permit(:customer_id, :large_category_id, :board_title, :board_text)
  end

end
