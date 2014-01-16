class Like < ActiveRecord::Base

  include PublicActivity::Model
  tracked except: :destroy,  owner: ->(controller, model) {controller && controller.current_user} ,
  		  :params => {:post_id => proc {|controller,model_instance| model_instance.post_id}}

  belongs_to :post
  belongs_to :profile
  attr_accessible :post_id, :user_id


  after_save :send_notification_mail 



  def send_notification_mail 

  	post = Post.find(post_id)
  	post_owner_profile = Profile.find(post.profile_id)

  	if post_owner_profile.user.email_for_new_like?  
	  	commented_user = User.find(user_id) 
	  	UserMailer.like_notification(post, post_owner_profile , commented_user).deliver
  	end

  end



end
