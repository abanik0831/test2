class RelationshipsController < ApplicationController

  def create
    @profile = Profile.find(params[:relationship][:followed_id])
    #@pr = Profile.where("profiles.id" => current_user.id).first
    current_user.follow!(@profile)
    #redirect_to @profile
    respond_to do |format|
     # format.html { redirect_to @profile }
      format.js
    end
  end

  def destroy
    @profile = Relationship.find(params[:id]).followed
    #@pr = Profile.where("profiles.id" => current_user.id).first
    current_user.unfollow!(@profile)
    #redirect_to @profile
    respond_to do |format|
     format.html { redirect_to @profile }
     format.js
    end
  end
  #def request_params
  #  params.require(:relationship).permit(:followed_id)
  #end


end