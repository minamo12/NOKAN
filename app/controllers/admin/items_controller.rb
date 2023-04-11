class Admin::ItemsController < ApplicationController

  def new

    if admin_signed_in?

      @items = Item.all
      @item = Item.new
      @large_categories = LargeCategory.all
      @@small_category = 0
      @@edit_small_category = 0

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

    else
      redirect_to root_path
    end

  end

  def create
    @item = Item.new(item_params)

    if @@small_category == 0
    else
      @item.large_category_id = @@small_category.medium_category.large_category.id
      @item.medium_category_id = @@small_category.medium_category.id
      @item.small_category_id = @@small_category.id
    end

    if @item.save
      redirect_to item_path(@item.id)
    else
      @large_categories = LargeCategory.all
      render action: :new
    end
  end

  def edit
    if admin_signed_in?
      @large_categories = LargeCategory.all

      @@edit_large_category = 0
      @@edit_medium_category = 0
      @@edit_small_category = 0

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
    else
      redirect_to root_path
    end
  end

  def update
    if admin_signed_in?

      @item = Item.find(params[:id])
      if @@edit_small_category == 0
      else
        @item.large_category_id = @@edit_small_category.medium_category.large_category.id
        @item.medium_category_id = @@edit_small_category.medium_category.id
        @item.small_category_id = @@edit_small_category.id
      end
      if @item.update(item_params)
        redirect_to item_path(@item.id)
      else
        @large_categories = LargeCategory.all
        render :edit
      end

      if params[:item][:other_image_ids]
        params[:item][:other_image_ids].each do |other_image_id|
          image = @item.other_images.find(other_image_id)
          image.purge
        end
      end

    else
      redirect_to root_path
    end
  end

  def destroy
    if admin_signed_in?
      @item = Item.find(params[:id])
      @item.destroy
      redirect_to items_path(small_category_id: @item.small_category.id)
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :information, :commentary, :reading, :image, :large_category_id, :medium_category_id, :small_category_id, other_images: [])
  end

end
