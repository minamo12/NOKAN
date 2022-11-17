class Admin::ItemsController < ApplicationController

  def new
    @items = Item.all
    @item = Item.new
    @large_categories = LargeCategory.all

    if params[:large_category_id].present?
      @@large_category = LargeCategory.find(params[:large_category_id])
      @medium_categories = @@large_category.medium_categories
    end

    if params[:medium_category_id].present?
      @@medium_category = MediumCategory.find(params[:medium_category_id])
      @medium_category = @@medium_category
      @small_categories = @@medium_category.small_categories
    end

    if params[:small_category_id].present?
      @@small_category = SmallCategory.find(params[:small_category_id])
      @small_category = @@small_category
    end

  end

  def create
    new
    @item = Item.new(item_params)
    @item.large_category_id = @@large_category.id
    @item.medium_category_id = @@medium_category.id
    @item.small_category_id = @@small_category.id
    @item.save
    redirect_to item_path(@item.id)
  end

  def edit
    @large_categories = LargeCategory.all

    if params[:large_category_id].present?
      @@edit_large_category = LargeCategory.find(params[:large_category_id])
      @medium_categories = @@edit_large_category.medium_categories
    end

    if params[:medium_category_id].present?
      @@edit_medium_category = MediumCategory.find(params[:medium_category_id])
      @medium_category = @@edit_medium_category
      @small_categories = @@edit_medium_category.small_categories
    end

    if params[:small_category_id].present?
      @@edit_small_category = SmallCategory.find(params[:small_category_id])
      @small_category = @@edit_small_category
    end
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.large_category_id = @@edit_large_category.id
    @item.medium_category_id = @@edit_medium_category.id
    @item.small_category_id = @@edit_small_category.id
    @item.update(item_params)
    redirect_to item_path(@item.id)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :information, :commentary, :reading, :image, :large_category_id, :medium_category_id, :small_category_id, other_images: [])
  end

end
