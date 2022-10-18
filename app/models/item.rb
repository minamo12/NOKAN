class Item < ApplicationRecord

  has_many :quizzes, dependent: :destroy

  belongs_to :large_category
  belongs_to :medium_category
  belongs_to :small_category

end
