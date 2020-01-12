class Commodity < ApplicationRecord

	attachment :commodity_image

	belongs_to :company

	has_many :reserves

end
