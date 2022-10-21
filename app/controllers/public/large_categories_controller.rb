class Public::LargeCategoriesController < ApplicationController

  def index
    @medium_categories = MediumCategory.all
    @large_categories = LargeCategory.all
    @small_categories = SmallCategory.all

    if params[:large_category_id].present?
      @large_category = LargeCategory.find(params[:large_category_id])
      @medium_categories = @large_category.medium_categories
    end

    if params[:medium_category_id].present?
      @medium_category = MediumCategory.find(params[:medium_category_id])
      @small_categories = @medium_category.small_categories
    end

  end

end

