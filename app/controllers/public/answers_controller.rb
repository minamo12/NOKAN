class Public::AnswersController < ApplicationController



  def new
    @answer = Answer.new
  end

  def create

  end

  private

  def answer_params
    params.require(:answer).permit(:mock_exam_id, :quiz_id, :answer, :scoring)
  end

end
