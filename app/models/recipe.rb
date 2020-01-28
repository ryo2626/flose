class Recipe < ApplicationRecord

	attachment :recipe_image

	belongs_to :public
	has_many :likes, dependent: :destroy
  has_many :liking_piblics, through: :likes, source: :public

	has_many :ingredients, dependent: :destroy
	accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

	has_many :cooks, dependent: :destroy
	accepts_nested_attributes_for :cooks, reject_if: lambda { |attributes| attributes['process_text'].blank? }, allow_destroy: true

	validates :dish_name, presence: true, length: { maximum: 20 }
	validates :comment, length: { maximum: 40 }
end
