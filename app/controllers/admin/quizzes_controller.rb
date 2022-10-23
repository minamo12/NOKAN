class Admin::QuizzesController < ApplicationController

  def new
    @quiz = Quiz.new
  end

  def create
    @item = Item.find(params[:item_id])
    @quiz = Quiz.new(quiz_params)
    @quiz.item_id = @item.id
    @quiz.save
    redirect_to item_path(@item.id)
  end

  def edit
    @item = Item.find(params[:item_id])
    @quiz = Quiz.find(params[:id])
  end

  def update
    @item = Item.find(params[:item_id])
    @quiz = Quiz.find(params[:id])
    @quiz.item_id = @item.id
    @quiz.update(quiz_params)
    redirect_to item_path(@item.id)
  end

  def destroy
    @item = Item.find(params[:item_id])
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    redirect_to item_path(@item.id)
  end

  private

  def quiz_params
    params.require(:quiz).permit(:question, :correct_answer, :item_id, :number_a_image, :number_b_image, :number_c_image)
  end

end
