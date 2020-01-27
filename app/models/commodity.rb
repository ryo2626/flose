class Commodity < ApplicationRecord

	attachment :commodity_image

	belongs_to :company
	has_many :reserves

	enum commodity_category:{買いに来て欲しい:0, 食べに来て欲しい:1}

	validates :commodity_name, presence: true, length: { maximum: 20 }
	validates :comment, length: { maximum: 40 }
	validates :regular_price, presence: true
	validates :sale_price, presence: true
	validates :quantity, presence: true
	validates :limit, presence: true
	validate :limit_cannot_be_in_the_past

	def limit_cannot_be_in_the_past
  	if limit.present? && limit.past?
    	errors.add(:limit, "(未来の日時を入力してください)")
  	end
	end

end
