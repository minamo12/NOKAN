class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def edit
  end

  def destroy
  end

end
