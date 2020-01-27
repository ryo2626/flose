class Ingredient < ApplicationRecord

	belongs_to :recipe

	validates :ingredient_name, presence: true, length: { maximum: 20 }
  validates :ingredient_amount, presence: true, length: { maximum: 20 }

end
