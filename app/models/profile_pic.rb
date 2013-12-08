class ProfilePic < ActiveRecord::Base
  belongs_to :profile
  belongs_to :splash_screen
  attr_accessible :image
  mount_uploader :image, ImageUploader

end
