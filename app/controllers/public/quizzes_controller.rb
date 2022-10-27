class Public::QuizzesController < ApplicationController

  def index
    if params[:large_category_id].present?
      @large_category = LargeCategory.find(params[:large_category_id])
      @items = @large_category.items
    end
  end

end
