class Comment < ActiveRecord::Base
  belongs_to :posts
  attr_accessible :user_id, :comment_visibility, :post_id, :cmtpost, :profile_id

  has_one :profile_pic
  accepts_nested_attributes_for :profile_pic
  attr_accessible :profile_pic_attributes


end
