class Relationship < ActiveRecord::Base

  include PublicActivity::Model
  tracked owner: ->(controller, model) {controller && controller.current_user} ,
  		  :params => {:followed_id => proc{ |controller, model_instance| model_instance.followed_id } }

  belongs_to :follower, class_name: "Profile"
  belongs_to :followed, class_name: "Profile"

  #validates :follower_id, presence: true
  #validates :followed_id, presence: true

  attr_accessible :username, :email, :password, :password_confirmation, :profile_attributes

  attr_accessible :followed_id, :follower_id

  after_save :send_notification_mail 



  def send_notification_mail 

  	#binding.pry
  	followed_user = User.find(followed_id)

  	if followed_user.email_for_new_follower?  
  		current_user = User.find(follower_id)
	  	UserMailer.follower_notification(followed_user, current_user).deliver
  	end

  end


end

