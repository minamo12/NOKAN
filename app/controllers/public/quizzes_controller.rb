class Public::QuizzesController < ApplicationController

  def index
    @mock_exam = MockExam.new
    @answer = Answer.new
    if params[:large_category_id].present?
      @large_category = LargeCategory.find(params[:large_category_id])
      @items = @large_category.items.order("RANDOM()")
    end
  end

end
