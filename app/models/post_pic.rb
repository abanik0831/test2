class PostPic < ActiveRecord::Base
  belongs_to :posts
  belongs_to :splash_screen
  attr_accessible :picture, :post_id, :profile_id
  mount_uploader :picture, ImageUploader


end
