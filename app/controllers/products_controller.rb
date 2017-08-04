class ProductsController < ApplicationController
	before_action :find_product, only: [:show,:edit,:update,:destroy]
	
	def index
		@products = Product.get_active_product
	end

	def new
		if user_signed_in?
		@product = current_user.products.build
		@categories = Category.get_all_categories
		else redirect_to  new_user_registration_path
		end
	end

	def create

		category = params[:category]
		user_id = current_user.id

		@product = Product.create(product_params, category, user_id)
		
		if @product.present?
			redirect_to products_path
		else
			redirect_to 'new'
		end

	end

	def show
	end

	def edit
		@categories = Category.get_all_categories
	end

	def update
		@categories = Category.get_all_categories
		if @product.update(product_params)
			redirect_to products_path
		else render 'edit'
		end
	end
	
	def destroy
	end

	def search
		if q ==1 
			params[q] = "Activate"
		elsif  q ==2
			params[q] = "Deactivate"
		end
		query = params[:q].present? ? params[:q] : 1 
		results=Product.where(status: 'query') 
	end

	private
	def product_params
		params.require(:product).permit(:name,:description,:cost_of_product,:no_of_stock,:status,:feature,:category_id,:product_img)
	end
	def find_product
		@product = Product.find(params[:id])
	end
end
