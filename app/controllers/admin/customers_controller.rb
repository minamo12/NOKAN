class Admin::CustomersController < ApplicationController

  def index
    if admin_signed_in?
      @customers = Customer.all
    else
      redirect_to root_path
    end
  end

  def edit
    if admin_signed_in?
      @customer = Customer.find(params[:id])
    end
  end

  def update
    @customer = Customer.find(params[:id])
    if admin_signed_in?
      if @customer.update(customer_params)
        redirect_to admin_customers_path
      else
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  def customer_params
    params.require(:customer).permit(:name, :is_active)
  end

end
