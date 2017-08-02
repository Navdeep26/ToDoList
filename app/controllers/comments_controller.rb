class CommentsController < ApplicationController
before_action :find_product

	def create
		@comment = @product.comments.create(product_params)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to product_path
		else render 'new'
	end


	private
	def product_params
		params.require(:comment).permit(:content)
	end

	def find_product
		@product = Product.find(params[:product_id])
	end

end
