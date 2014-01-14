class Comment < ActiveRecord::Base

  include PublicActivity::Model
  tracked owner: ->(controller, model) {controller && controller.current_user} ,
  		  :params => {:post_id => proc {|controller,model_instance| model_instance.post_id}}

  belongs_to :posts
  attr_accessible :user_id, :comment_visibility, :post_id, :cmtpost, :profile_id

  validates :cmtpost, :presence => true

  has_one :profile_pic
  accepts_nested_attributes_for :profile_pic
  attr_accessible :profile_pic_attributes


end



