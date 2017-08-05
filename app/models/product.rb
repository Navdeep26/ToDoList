class Product < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_attached_file :product_img, styles: { product_index: "250x350>", product_show: "325x525>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :product_img, content_type: /\Aimage\/.*\z/
	
	def self.get_active_product
	 Product.where(status: 'Activate') 
	end
	
	def self.create(e, cat, user_id)
		prod = Product.new
		prod.name = e[:name]
		prod.description = e[:description]
		prod.cost_of_product = e[:cost_of_product]
		prod.no_of_stock = e[:no_of_stock]
		prod.status = e[:status]
		prod.feature = e[:feature]
		prod.category_id = cat
		prod.user_id = user_id
		
		prod.save
	end


	def self.update(id, e, cat, user_id)

		prod = Product.find(id)

		prod.name = e[:name]
		prod.description = e[:description]
		prod.cost_of_product = e[:cost_of_product]
		prod.no_of_stock = e[:no_of_stock]
		prod.status = e[:status]
		prod.feature = e[:feature]
		prod.category_id = cat
		prod.user_id = user_id
		prod.save
	end
end

