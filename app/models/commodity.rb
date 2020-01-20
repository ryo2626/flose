class Commodity < ApplicationRecord

	attachment :commodity_image

	belongs_to :company

	has_many :reserves

	enum commodity_category:{買いに来て欲しい:0, 食べに来て欲しい:1}
end
