class BoardPost < ApplicationRecord

  has_many :comments, dependent: :destroy

  belongs_to :customer
  belongs_to :large_category

  validates :board_title, presence: true
  validates :board_text, presence: true

end
