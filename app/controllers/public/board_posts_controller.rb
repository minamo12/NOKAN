class Public::BoardPostsController < ApplicationController

  def index
    @board_posts = BoardPost.page(params[:page]).per(8).order(id: "DESC")
  end

  def new
    @board_post = BoardPost.new
  end

  def create
    @board_post = BoardPost.new(board_post_params)
    @board_post.customer_id = current_customer.id
    if @board_post.save
      redirect_to board_posts_path
    else
      render :new
    end
  end

  def show
    @board_post = BoardPost.find(params[:id])
    @comment = Comment.new
    @comments = @board_post.comments
  end

  def my_posts
    @customer = current_customer
    @my_posts = @customer.board_posts
  end

  def destroy
    @board_post = BoardPost.find(params[:id])
    @board_post.destroy
    if admin_signed_in?
      redirect_to board_posts_path
    else
      redirect_to board_post_my_posts_path
    end
  end

  private

  def board_post_params
    params.require(:board_post).permit(:customer_id, :large_category_id, :board_title, :board_text)
  end

end
