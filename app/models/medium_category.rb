class MediumCategory < ApplicationRecord

  has_many :items, dependent: :destroy
  has_many :small_categories, dependent: :destroy

  belongs_to :large_category

  validates :name, presence: true

end
