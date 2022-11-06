class MockExam < ApplicationRecord

  has_many :exam_and_quizzes, dependent: :destroy
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers

  belongs_to :customer

end
