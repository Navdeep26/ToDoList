class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user

  def self.create(e,user_id)
    logger.info('hi')
    logger.info(e).inspect
  	comment = Comment.new
  	comment.content = e[:q]
  	comment.product_id = e[:product_id]
  	comment.user_id = user_id
  	
  	comment.save

  end
end
