class UserMailer < ActionMailer::Base
  default from: 'admin@startupsocial.com'



  def comment_notification(post, p_o_pf, c_user_pf)
    @commented_user = c_user_pf
    @post_owner_profile = p_o_pf
    @post_owner = p_o_pf.user
    @post = post
    mail(:to => @post_owner.email, :subject => "Comment Notification Mail")
  end


  
  def like_notification(post, p_o_pf, c_user)
    @commented_user = c_user
    @post_owner_profile = p_o_pf
    @post_owner = p_o_pf.user
    @post = post

    mail(:to => @post_owner.email, :subject => "Like Notification Mail")

  end

  def follower_notification(followed_user, user)
    @current_user = user
    @followed_user = followed_user
    mail(:to => @followed_user.email, :subject => "Follower Notification") 
  end

end
