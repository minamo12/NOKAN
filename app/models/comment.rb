class Comment < ApplicationRecord

  belongs_to :customer
  belongs_to :board_post

  validates :comment_text, presence: true

end
