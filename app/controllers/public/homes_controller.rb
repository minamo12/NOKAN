class Public::HomesController < ApplicationController

  def top
    @large_categories = LargeCategory.all
    @items = Item.all
  end

  def about
  end
end
