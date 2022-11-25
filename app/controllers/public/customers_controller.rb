class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
    @mock_exams = @customer.mock_exams.order(id: "DESC")
    @board_posts = @customer.board_posts.order(id: "DESC")
    @comments = @customer.comments.order(id: "DESC")
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path
    else
      render :edit
    end
  end

  def withdraw
    @customer = current_customer
    @customer.update(customer_params)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :is_active)
  end

end
