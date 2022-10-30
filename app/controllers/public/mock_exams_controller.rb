class Public::MockExamsController < ApplicationController

  def index
  end

  def show
  end

  def create
    @mock_exam = MockExam.new(mock_exam_params)
    @mock_exam.save
    redirect_to root_path
  end

  private

  def mock_exam_params
    params.require(:mock_exam).permit(:point, :answer, :scoring)
  end

end
