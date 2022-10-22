class Quiz < ApplicationRecord

  has_many :exam_and_quizzes, dependent: :destroy
  has_one_attached :number_a_image
  has_one_attached :number_b_image
  has_one_attached :number_c_image

  belongs_to :item

  def number_a_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.ipg')
      image.attach(io: File.open(file_path), filename: 'default-image.ipg', content_type: 'image/jpeg')
  	end
  	number_a_image.variant(resize_to_limit: [width, height]).processed
  end

  def number_b_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.ipg')
      image.attach(io: File.open(file_path), filename: 'default-image.ipg', content_type: 'image/jpeg')
  	end
  	number_b_image.variant(resize_to_limit: [width, height]).processed
  end

  def number_c_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.ipg')
      image.attach(io: File.open(file_path), filename: 'default-image.ipg', content_type: 'image/jpeg')
  	end
  	number_c_image.variant(resize_to_limit: [width, height]).processed
  end

end
