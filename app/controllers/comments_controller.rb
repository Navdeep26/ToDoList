class CommentsController < ApplicationController
before_action :find_product

	def create
		logger.info(params)
		user_id = current_user.id
		@comment = Comment.create(product_params,user_id)
		

		if @comment.present?
			redirect_to product_path
		else render 'new'
		end
	end


	private
	
	def product_params
		params.require(:comment).permit(:content,:product_id)
	end

	def find_product
		@product = Product.find(params[:product_id])
	end

end
