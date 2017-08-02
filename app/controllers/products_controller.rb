class ProductsController < ApplicationController
before_action :find_product, only: [:show,:edit,:update,:destroy]
	def index
		@products = Product.all
	end

	def new
		if user_signed_in?
		@product = current_user.products.build
		else redirect_to  new_user_registration_path
		end
	end

	def create
		@product = current_user.products.build(product_params)
		if @product.save
			redirect_to products_path
		else redirect_to 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @product.update(product_params)
			redirect_to products_path
		else render 'edit'
		end
	end
	
	def destroy
	end

	private
	def product_params
		params.require(:product).permit(:name,:description,:cost_of_product,:no_of_stock,:status,:feature)
	end
	def find_product
		@product = Product.find(params[:id])
	end
end
