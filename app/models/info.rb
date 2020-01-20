class Info < ApplicationRecord

	belongs_to :public
	belongs_to :company

	enum user_status:{利用者:0, 企業:1}
	enum info_status:{未回答:0, 回答済み:1}
end
