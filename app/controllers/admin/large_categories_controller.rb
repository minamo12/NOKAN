class Admin::LargeCategoriesController < ApplicationController

  def index
    @large_categories = LargeCategory.all
    @large_category = LargeCategory.new
  end

  def new
    @large_category = LargeCategory.new
  end

  def large_create
    @large_category = LargeCategory.new(large_category_params)
    @large_category.save
    redirect_to admin_large_categories_path
  end

  private

  def large_category_params
    params.require(:large_category).permit(:name)
  end

end
