class Commodity < ApplicationRecord

	attachment :commodity_image

	belongs_to :company

	has_many :reserves

	enum commodity_category:{買いに来て欲しい:0, 食べに来て欲しい:1}

	def limit_cannot_be_in_the_past
  	if schedule.present? && schedule.past?
    	errors.add(:limit, "過去の日時です。")
  	end
	end
end
