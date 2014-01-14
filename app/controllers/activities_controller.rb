class ActivitiesController < ApplicationController
  def index
    @activities = ::PublicActivity::Activity.order("created_at desc") 

    @today_activities = []
    @yesterday_activities = []
    @remaining_activities = []
    
	@activities.each do |activity| 
	  	if activity.created_at.to_date == Date.today 
	    	@today_activities << activity 
	  	elsif activity.created_at.to_date == Date.today - 1.day 
	     	@yesterday_activities << activity   
	    else 
	     	@remaining_activities << activity 
	    end 
	end 

  end


end







