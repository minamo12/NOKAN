class Public::HomesController < ApplicationController

  def top
    @large_categories = LargeCategory.all
  end

  def about
  end
end
