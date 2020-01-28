class Info < ApplicationRecord

	belongs_to :public
	belongs_to :company

	enum user_status:{利用者:0, 企業:1}
	enum info_status:{未回答:0, 回答済み:1}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :lcontributor_email, presence: true, format: { with: VALID_EMAIL_REGEX }
	validates :luser_status, presence: true
  validates :lcontributor, presence: true
  validates :linfo_content, presence: true
  validates :linfo_status, presence: true

end
