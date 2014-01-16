class Comment < ActiveRecord::Base

  include PublicActivity::Model
  tracked except: :destroy, owner: ->(controller, model) {controller && controller.current_user} ,
  		  :params => {:post_id => proc {|controller,model_instance| model_instance.post_id}}

  belongs_to :posts
  attr_accessible :user_id, :comment_visibility, :post_id, :cmtpost, :profile_id

  validates :cmtpost, :presence => true

  has_one :profile_pic
  accepts_nested_attributes_for :profile_pic
  attr_accessible :profile_pic_attributes

  after_save :send_notification_mail 


  def send_notification_mail 

  	post = Post.find(post_id)
  	post_owner_profile = Profile.find(post.profile_id)

  	if post_owner_profile.user.email_for_new_cmnt?
	  	commented_user_profile = Profile.find(profile_id) 
	  	UserMailer.comment_notification(post, post_owner_profile , commented_user_profile).deliver
  	end


  end






end



