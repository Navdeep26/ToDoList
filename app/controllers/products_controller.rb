class ProductsController < ApplicationController
	layout 'application', except: [:search,:merge]
	before_action :find_product, only: [:show,:edit,:update,:destroy]
	
	def index
		@products = Product.get_active_product.paginate(page: params[:page], per_page: 8)
	end

	def new
		if user_signed_in?
		@product = current_user.products.build
		@categories = Category.get_all_categories
		else redirect_to  new_user_registration_path
		end
	end

	def create
		logger.info(params)
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

		category = params[:category]
		user_id = current_user.id
		id = params[:id]
		
		puts params 

		@product = Product.update(id, product_params,category,user_id)
		if @product.present?
			redirect_to products_path
		else render 'edit'
		end
	end
	
	def destroy
		@product.destroy
		redirect_to root_path
	end

	def search
		if params[:q] == "1" 
			
			params[:q] = "Activate"
		elsif  params[:q] == "2"
			
			params[:q] = "Deactivate"
		else
			
		end

		query = params[:q].present? ? params[:q] : 1 
		@products = Product.where(status: query) 
		render 'index', layout: false
	end

	def merge
		if params[:q] == "1"
			logger.info("hi")
			params[:q] = 1
		elsif params[:q] == "2"
			logger.info("hii")
			params[:q] = 2
		else params[:q] == "3"
			logger.info("hiii")
			params[:q] = 3
		end
		query = params[:q].present? ? params[:q] : 1
		logger.info(query)
		@products = Product.where(category_id: query)
		render 'index', layout: false		
	end

	private
	def product_params
		params.require(:product).permit(:name,:description,:cost_of_product,:no_of_stock,:status,:feature,:category_id,:product_img)
	end
	def find_product
		@product = Product.find(params[:id])
	end
end
