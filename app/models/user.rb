class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :topics, dependent: :destroy

  validates :first_name, :last_name, presence: true

  validates :email, length: { maximum: 255 },
                    format: { with: Globals::Constant::EMAIL_FORMAT, allow_blank: true }

  def full_name
    [first_name, last_name].join(' ')
  end
end
