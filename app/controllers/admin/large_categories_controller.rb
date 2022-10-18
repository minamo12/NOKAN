class Admin::LargeCategoriesController < ApplicationController

  def index
    @large_categories = LargeCategory.all
    @large_category = LargeCategory.new
    @medium_categories = MediumCategory.all
    @medium_category = MediumCategory.new
  end

  def large_create
    @large_category = LargeCategory.new(large_category_params)
    @large_category.save
    redirect_to admin_large_categories_path
  end

  def medium_create
    @medium_category = MediumCategory.new(medium_category_params)
    @medium_category.save
    redirect_to admin_large_categories_path
  end

  private

  def large_category_params
    params.require(:large_category).permit(:name)
  end

  def medium_category_params
    params.require(:medium_category).permit(:name, :large_category_id)
  end

end
