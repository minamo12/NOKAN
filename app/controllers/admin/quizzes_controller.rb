class Admin::QuizzesController < ApplicationController

  def new
    @quiz = Quiz.new
  end

  def create
    @item = Item.find(params[:item_id])
    @quiz = Quiz.new(quiz_params)
    @quiz.item_id = @item.id
    binding.pry
    @quiz.save
    redirect_to item_path(@item.id)
  end

  def edit
  end

  private

  def quiz_params
    params.require(:quiz).permit(:question, :correct_answer, :item_id, :number_a_image, :number_b_image, :number_c_image)
  end

end
