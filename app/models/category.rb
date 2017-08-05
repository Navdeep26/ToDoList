class Category < ApplicationRecord
	has_many :products

	def self.get_all_categories
		Category.all
	end
	
end
