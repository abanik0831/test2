#class RegistrationsController < Devise::RegistrationsController
#
#  #def after_sign_in_path_for(resource)
#  #  redirect_to :controller => "requests", :action => "new"
#  #end
#
#end

# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController

  #base.class_eval do
  #  before_create :create_profile
  #end
  #
  #def create_profile
  #  profile = Profile.create
  #  #self.default_card = profile.id
  #  # Maybe check if profile gets created and raise an error
  #  #  or provide some kind of error handling
  #end

  def new
    super
  end

  #def create
  #  super
  #  @profile = Profile.new
  #  @profile_pic = ProfilePic.new
  #  @profile.save
  #  @profile_pic.profile_id = @profile.id
  #
  #  @profile_pic.save
  #
  #end

  def create
    build_resource(sign_up_params)

    if resource.save
      if resource.active_for_authentication?
        @profile = Profile.new
        @profile_pic = ProfilePic.new
        @profile.save
        @profile_pic.profile_id = @profile.id
        @profilepicidsave = Profile.find(@profile.id)
        @profilepicidsave.profilepicid = @profile.id
        @profilepicidsave.save
        @profile_pic.save
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  protected

  def after_sign_up_path_for(resource)
    edit_profile_path(current_user.id)
  end

  def update
    super
  end

end