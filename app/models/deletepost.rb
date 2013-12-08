class Deletepost < ActiveRecord::Base
  belongs_to :posts
  attr_accessible :post_id, :user_id
end
