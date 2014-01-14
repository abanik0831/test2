class Like < ActiveRecord::Base

  include PublicActivity::Model
  tracked except: :update,  owner: ->(controller, model) {controller && controller.current_user} ,
  		  :params => {:post_id => proc {|controller,model_instance| model_instance.post_id}}

  belongs_to :post
  belongs_to :profile
  attr_accessible :post_id, :user_id
end
