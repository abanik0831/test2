class Profile < ActiveRecord::Base
  has_one :profile_pic, :dependent => :destroy
  has_many :posts
  attr_accessible :post, :post_id, :profile_id
  attr_accessible :f_name, :l_name, :title, :area, :skills, :fb_url, :linkedin_url, :meetup_url, :twitter_url, :profilepicid, :angellist_url, :image, :user_id
  belongs_to :user
  accepts_nested_attributes_for :profile_pic
  attr_accessible :profile_pic_attributes

  #extend FriendlyId
  #friendly_id :f_name

end
