class Info < ApplicationRecord

	belongs_to :public
	belongs_to :company

	enum user_status:{利用者:0, 企業:1, その他:2}
	enum info_status:{未回答:0, 回答済み:1}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :contributor_email, presence: true, format: { with: VALID_EMAIL_REGEX }
	validates :user_status, presence: true
  validates :contributor, presence: true
  validates :info_content, presence: true
  validates :info_status, presence: true

end
