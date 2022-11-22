class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:name]

  validates_uniqueness_of :name
  validates_presence_of :name

  has_many :mock_exams, dependent: :destroy
  has_many :board_posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true


  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["name = :value", { :value => name }]).first
    else
      where(conditions).first
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

   def will_save_change_to_email?
     false
   end

end
