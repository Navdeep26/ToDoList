class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user

  def self.create(e,user_id)
  	comment = Comment.new
  	comment.content = e[:q]
  	comment.product_id = e[:product_id]
  	comment.user_id e[:user_id]
  	
  	comment.save

  end
end
