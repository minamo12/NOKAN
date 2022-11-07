class Public::LargeCategoriesController < ApplicationController

  def index
    @medium_categories = MediumCategory.all

    if params[:large_category_id].present?
      @large_category = LargeCategory.find(params[:large_category_id])
      @medium_categories = @large_category.medium_categories
    end

  end

end

