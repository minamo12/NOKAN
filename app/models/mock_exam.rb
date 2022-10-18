class MockExam < ApplicationRecord

  has_many :exam_and_quizzes, dependent: :destroy

  belongs_to :customer

end
