class LargeCategory < ApplicationRecord

  has_many :items, dependent: :destroy
  has_many :board_posts, dependent: :destroy
  has_many :medium_categories, dependent: :destroy

  validates :name, presence: true

end
