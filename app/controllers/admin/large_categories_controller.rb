class Admin::LargeCategoriesController < ApplicationController

  def index
    @large_categories = LargeCategory.all
    @large_category = LargeCategory.new
    @medium_categories = MediumCategory.all
    @medium_category = MediumCategory.new
    @small_categories = SmallCategory.all
    @small_category = SmallCategory.new
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
    @medium_category.save
    redirect_to admin_large_categories_path
  end

  def medium_destroy
    @medium__categories = MediumCategory.find(params[:id])
    @medium__categories.destroy
    redirect_to admin_large_categories_path
  end

  # 小カテゴリ

  def small_create
    @small_category = SmallCategory.new(small_category_params)
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
