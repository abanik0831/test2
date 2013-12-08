class Splash_screen < ActiveRecord::Base
  has_many :requests
  has_many :posts
  has_many :comments
  attr_accessible :name, :email, :id
  has_one :profile_pic
  accepts_nested_attributes_for :profile_pic
  attr_accessible :profile_pic_attributes
  attr_accessible :posts, :profile_id, :visibility, :profileid_del
  belongs_to :users
  has_one :post_pic, :dependent => :destroy
  accepts_nested_attributes_for :post_pic
  attr_accessible :post_pic_attributes
  attr_accessible :user_id, :comment_visibility, :post_id, :cmtpost, :profile_id

end