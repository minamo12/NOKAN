class Item < ApplicationRecord

  has_many :quizzes, dependent: :destroy
  has_one_attached :image

  belongs_to :large_category
  belongs_to :medium_category
  belongs_to :small_category

def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.ipg')
    image.attach(io: File.open(file_path), filename: 'default-image.ipg', content_type: 'image/jpeg')
	end
	image.variant(resize_to_limit: [width, height]).processed
end

def get_other_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.ipg')
    image.attach(io: File.open(file_path), filename: 'default-image.ipg', content_type: 'image/jpeg')
	end
	other_image.variant(resize_to_limit: [width, height]).processed
end

end
