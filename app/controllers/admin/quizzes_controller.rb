class Admin::QuizzesController < ApplicationController

  def new
    @quiz = Quiz.new
  end

  def create
    @item = Item.find(params[:item_id])
    @quiz = Quiz.new(quiz_params)
    @quiz.item_id = @item.id
    if @quiz.save
      redirect_to item_path(@item.id)
    else
      @quizzes = @item.quizzes
      render template: "public/items/show"
    end
  end

  def edit
    if admin_signed_in?
      @item = Item.find(params[:item_id])
      @quiz = Quiz.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    if admin_signed_in?
      @item = Item.find(params[:item_id])
      @quiz = Quiz.find(params[:id])
      @quiz.item_id = @item.id
      if @quiz.update(quiz_params)
        redirect_to item_path(@item.id)
      else
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    if admin_signed_in?
      @item = Item.find(params[:item_id])
      @quiz = Quiz.find(params[:id])
      @quiz.destroy
      redirect_to item_path(@item.id)
    else
      redirect_to root_path
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:question, :correct_answer, :item_id, :number_a_image, :number_b_image, :number_c_image)
  end

end
