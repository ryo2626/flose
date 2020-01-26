class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable

  validates :release_date, presence: true
  validates :comment, length: { maximum: 30 }
end
