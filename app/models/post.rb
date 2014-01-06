class Post < ActiveRecord::Base

  include PublicActivity::Model
  tracked owner: ->(controller, model) {controller && controller.current_user}

  belongs_to :profiles
  belongs_to :splash_screen
  has_many :post_pics
  accepts_nested_attributes_for :post_pics
  attr_accessible :post_pics_attributes
  attr_accessible :profile_id, :post, :visibility, :profileid_del

  has_many :comments
  attr_accessible :cmtpost, :post_id, :comment_visibility, :user_id

  validates :post, :presence => true


  has_many :deleteposts
  attr_accessible :post_id, :user_id

  has_many :likes, :include => :profile

  has_many :profiles, :through => :likes

  has_many :liked_by, :through => :likes, :class_name => 'Profile'

  attr_accessible :post_id, :profile_id

end
