class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to root_path
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :information, :commentary, :image, :other_image, :large_category_id, :medium_category_id, :small_category_id)
  end

end
