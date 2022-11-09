class Public::MockExamsController < ApplicationController

  def index
    customer = current_customer
    @mock_exams = customer.mock_exams
  end

  def show
    @mock_exam = MockExam.find(params[:id])
  end

  def new
    @mock_exam = MockExam.new
    @mock_exam.answers.build
  end

  def create
    @mock_exam = MockExam.new(mock_exam_params)
    @mock_exam.customer_id = current_customer.id
    @mock_exam.save
    redirect_to mock_exams_path
  end

  def destroy
    @mock_exam = MockExam.find(params[:id])
    @mock_exam.destroy
    redirect_to mock_exams_path
  end

  private

  def mock_exam_params
    params.require(:mock_exam).permit(:point, :customer_id, answers_attributes: [:quiz_id, :answer, :scoring])
  end

end
