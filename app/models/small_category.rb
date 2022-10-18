class SmallCategory < ApplicationRecord

  has_many :items, dependent: :destroy

  belongs_to :medium_category

end
