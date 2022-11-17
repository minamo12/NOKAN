class Admin::LargeCategoriesController < ApplicationController

  Item.order(:name)

  def index
    # すべて表示
    @large_categories = LargeCategory.all
    @medium_categories = MediumCategory.all
    @small_categories = SmallCategory.all
    @large_category = LargeCategory.new
    @medium_category = MediumCategory.new
    @small_category = SmallCategory.new

    @items = Item.all
    @quizzes = Quiz.all

    if params[:large_category_id].present?
      @@large_select = LargeCategory.find(params[:large_category_id])
      @large_select = @@large_select
      @medium_selects = @@large_select.medium_categories
    end

    if params[:medium_category_id].present?
      @@medium_select = MediumCategory.find(params[:medium_category_id])
      @medium_select = @@medium_select
    end
  end

  # 大カテゴリ

  def large_create
    @large_category = LargeCategory.new(large_category_params)
    @large_category.save
    redirect_to admin_large_categories_path
  end

  def large_destroy
    @large_categories = LargeCategory.find(params[:id])
    @large_categories.destroy
    redirect_to admin_large_categories_path
  end

  # 中カテゴリ

  def medium_create
    @medium_category = MediumCategory.new(medium_category_params)
    @medium_category.large_category_id = @@large_select.id
    @medium_category.save
    redirect_to admin_large_categories_path
  end

  def medium_destroy
    @medium_categories = MediumCategory.find(params[:id])
    @medium_categories.destroy
    redirect_to admin_large_categories_path
  end

  # 小カテゴリ

  def small_create
    @small_category = SmallCategory.new(small_category_params)
    @small_category.medium_category_id = @@medium_select.id
    @small_category.save
    redirect_to admin_large_categories_path
  end

  def small_destroy
    @small_categories = SmallCategory.find(params[:id])
    @small_categories.destroy
    redirect_to admin_large_categories_path
  end

  private

  def large_category_params
    params.require(:large_category).permit(:name)
  end

  def medium_category_params
    params.require(:medium_category).permit(:name, :large_category_id)
  end

  def small_category_params
    params.require(:small_category).permit(:name, :medium_category_id)
  end

end
