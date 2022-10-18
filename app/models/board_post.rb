class BoardPost < ApplicationRecord

  has_many :comments, dependent: :destroy

  belongs_to :customer
  belongs_to :large_category

end
