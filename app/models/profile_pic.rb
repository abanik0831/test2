class ProfilePic < ActiveRecord::Base
  belongs_to :profile
  belongs_to :splash_screen
  belongs_to :comment
  attr_accessible :image, :profile_id
  mount_uploader :image, ImageUploader

end
