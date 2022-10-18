class ExamAndQuiz < ApplicationRecord

  belongs_to :quiz
  belongs_to :mock_exam

end
