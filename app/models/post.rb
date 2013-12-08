class Post < ActiveRecord::Base
  belongs_to :profiles
  belongs_to :splash_screen
  has_many :post_pics
  accepts_nested_attributes_for :post_pics
  attr_accessible :post_pics_attributes
  attr_accessible :profile_id, :post, :visibility, :profileid_del

  has_many :comments
  attr_accessible :cmtpost, :post_id, :comment_visibility, :user_id

  has_many :deleteposts
  attr_accessible :post_id, :user_id

end
