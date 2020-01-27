class Public < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :recipes
	has_many :reserves
	has_many :infos

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :lastname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :firstname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :phone, presence: true, format: { with: /\A[0-9]+\z/ }
  validates :postalcode, presence: true, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true, length: { maximum: 50 }
  validates :nickname, presence: true, length: { maximum: 8 }

	acts_as_paranoid
end
