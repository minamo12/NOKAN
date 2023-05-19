class LargeCategory < ApplicationRecord

  has_many :items, dependent: :destroy
  has_many :medium_categories, dependent: :destroy

end
