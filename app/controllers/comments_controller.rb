class CommentsController < ApplicationController
before_action :find_product

	def create
		logger.info('hi')
		user_id = current_user.id

		@comment = Comment.create(product_params,user_id)
		

		if @comment.present?
			redirect_to "/products/#{params[:product_id]}"
		else render 'new'
		end
	end


	private
	
	def product_params
		params.permit(:q,:product_id)
	end

	def find_product
		@product = Product.find(params[:product_id])
	end

end
