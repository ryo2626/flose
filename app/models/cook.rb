class Cook < ApplicationRecord

	belongs_to :recipe

	validates :process_count, presence: true
  validates :process_text, presence: true

end
