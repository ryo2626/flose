class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :commodities
	has_many :infos

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :company_name, presence: true
  validates :phone, presence: true, format: { with: /\A[0-9]+\z/ }
  validates :postalcode, presence: true, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true, length: { maximum: 50 }

	acts_as_paranoid
end
