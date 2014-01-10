class Like < ActiveRecord::Base
  belongs_to :post
  belongs_to :profile
  attr_accessible :post_id, :user_id
end
