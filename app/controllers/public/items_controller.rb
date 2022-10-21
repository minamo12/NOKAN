class Public::ItemsController < ApplicationController

  def index
    @medium_categories = MediumCategory.all
    @small_categories = SmallCategory.all

    if params[:small_category_id].present?
      @small_category = LargeCategory.find(params[:small_category_id])
      @items = @small_category.items
    end
  end

  def show
  end

end
