class Item < ApplicationRecord

  has_many :quizzes, dependent: :destroy
  has_one_attached :image
  has_many_attached :other_images
  has_one_attached :number_a_image
  has_one_attached :number_b_image
  has_one_attached :number_c_image

  belongs_to :large_category
  belongs_to :medium_category
  belongs_to :small_category

def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
	end
	image.variant(resize_to_limit: [width, height]).processed
end

def get_other_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
	end
	other_image.variant(resize_to_limit: [width, height]).processed
end

  def get_number_a_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  	end
  	number_a_image.variant(resize_to_limit: [width, height]).processed
  end

  def get_number_b_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  	end
  	number_b_image.variant(resize_to_limit: [width, height]).processed
  end

  def get_number_c_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  	end
  	number_c_image.variant(resize_to_limit: [width, height]).processed
  end

end
