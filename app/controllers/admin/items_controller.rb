class Admin::ItemsController < ApplicationController

  def new
    @items = Item.all
    @item = Item.new
    @large_categories = LargeCategory.all

    if params[:large_category_id].present?
      @@large_category = LargeCategory.find(params[:large_category_id])
      @medium_categories = @@large_category.medium_categories
      @large_category = @@large_category
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
    @item = Item.new(item_params)

    if @large_category.present?
      @item.large_category_id = @@large_category.id
    else
    end

    if @medium_category.present?
      @item.medium_category_id = @@medium_category.id
    else
    end

    if @small_category.present?
      @item.small_category_id = @@small_category.id
    else
    end

    if @item.save
      redirect_to item_path(@item.id)
    else
      @large_categories = LargeCategory.all
      render action: :new
    end
  end

  def edit
    @large_categories = LargeCategory.all

    if params[:large_category_id].present?
      @@edit_large_category = LargeCategory.find(params[:large_category_id])
      @medium_categories = @@edit_large_category.medium_categories
      @large_category = @@edit_large_category
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
    if @large_category.present?
      @item.large_category_id = @@edit_large_category.id
    else
    end

    if @medium_category.present?
      @item.medium_category_id = @@edit_medium_category.id
    else
    end

    if @small_category.present?
      @item.small_category_id = @@edit_small_category.id
    else
    end
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      @large_categories = LargeCategory.all
      render :edit
    end
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
