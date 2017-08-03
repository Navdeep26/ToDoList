class Product < ApplicationRecord
	belongs_to :user
	
	def self.get_active_product
	 Product.where(status: 'Activate') 
	end
	
end
