class Like < ApplicationRecord
	belongs_to :recipe, counter_cache: :likes_count
  belongs_to :public
end
