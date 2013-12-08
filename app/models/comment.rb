class Comment < ActiveRecord::Base
  belongs_to :posts
  attr_accessible :user_id, :comment_visibility, :post_id, :cmtpost
end
