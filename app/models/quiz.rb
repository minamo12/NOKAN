class Quiz < ApplicationRecord

  has_many :exam_and_quizzes, dependent: :destroy

  belongs_to :item

end
