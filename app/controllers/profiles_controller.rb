class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /profiles
  # GET /profiles.json


  #def same_user?(profile)
  #  self.profiles.exists?(:id => profile.id)
  #end

  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @postnew = Post.new
    @dash_post = Post.all
    @dash_pic = ProfilePic.all

    @dash_post_array = (@dash_post.to_a + @post.to_a)

    @dash_pic_array = @dash_pic.to_a.sort_by { |obj| obj.created_at }.reverse!

    @dash_post_array_sorted = @dash_post_array.sort_by { |obj| obj.created_at }
    @dash_post_array_sorted_reverse = @dash_post_array_sorted.reverse!

    @profilepic = ProfilePic.all

    @Postvisibility = Post.all
    @post = Post.joins(:comments).where("posts.id = comments.post_id").first
    @postpic = PostPic.order("created_at DESC").all

    @profilescan = Profile.all

    @profpic = ProfilePic.where("profile_pics.id" => current_user.id).first



   # @user = User.new
    @crntuser = Profile.where("profiles.id" => current_user.id).first
    @comment = @postnew.comments.build

    @profiles = Profile.find(params[:id])

    @user = User.find(params[:id])
    @usersfollowed = @user.followers
    @usersfollowing = @user.followed_users

    @profiles = Profile.find(params[:id])

    #@areafind = @profiles.area
    #
    #if @areafind == "Downtown"
    #  @areafindanswer = downtown_profile_path(@profiles)
    #end
    #
    #if @areafind == "Santa Monica"
    #  @areafindanswer = santamonicausers_profile_path(@profiles)
    #end
    #
    #if @areafind == "Venice Beach"
    #  @areafindanswer = venicebeachuser_profile_path(@profiles)
    #end
    #
    #if @areafind == "Culver City"
    #  @areafindanswer = culvercityusers_profile_path(@profiles)
    #end
    #
    #if @areafind == "San Fernando Valley"
    #  @areafindanswer = sanfernandovalleyusers_profile_path(@profiles)
    #end
    #
    #if @areafind == "Burbank"
    #  @areafindanswer = burbank_profile_path(@profiles)
    #end
    #
    #if @areafind == "Beverly Hills"
    #  @areafindanswer = beverlyhillsuser_profile_path(@profiles)
    #end
    #
    #if @areafind == "Hollywood"
    #  @areafindanswer = hollywoodusers_profile_path(@profiles)
    #end
    #
    #if @areafind == "Pasadena"
    #  @areafindanswer = pasadenausers_profile_path(@profiles)
    #end

    #@relationships = @crntuser.relationships.build(followed_id: @profiles.id)
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
    @profile.build_profile_pic
    @pic = ProfilePic.new(params[:profile_pic])

    #@profile.image = @pic.image
    #@profile.save

  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users
    @profiles = Profile.find(params[:id])
    #.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    @profiles = Profile.find(params[:id])
    #.paginate(page: params[:page])
    render 'show_follow'
  end


  def usersearch
    if user_signed_in?
      @profpic = ProfilePic.where('profile_pics.id' => current_user.id).first
    end
    @user = User.find(params[:id])
    @profiles = Profile.find(params[:id])
    #.paginate(page: params[:page])
  end

  def usersearch1
    if user_signed_in?
      @profpic = ProfilePic.where('profile_pics.id' => current_user.id).first
    end
    @user = User.find(params[:id])
    @profiles = Profile.find(params[:id])
    #.paginate(page: params[:page])
  end

  def usersearch2
    if user_signed_in?
      @profpic = ProfilePic.where('profile_pics.id' => current_user.id).first
    end
    @user = User.find(params[:id])
    @profiles = Profile.find(params[:id])
    #.paginate(page: params[:page])
  end


  #:beverlyhillsuser, :burbank, :downtown, :hollywoodusers, :culvercityusers, :santamonicausers, :pasadenausers, :sanfernandovalleyusers, :venicebeachuser

  def beverlyhillsuser
    if user_signed_in?
      @profpic = ProfilePic.where('profile_pics.id' => current_user.id).first
    end
    @user = User.find(params[:id])
    @profiles = Profile.find(params[:id])
  end

  def burbank
    if user_signed_in?
      @profpic = ProfilePic.where('profile_pics.id' => current_user.id).first
    end
    @user = User.find(params[:id])
    @profiles = Profile.find(params[:id])
  end

  def downtown
    if user_signed_in?
      @profpic = ProfilePic.where('profile_pics.id' => current_user.id).first
    end
    @user = User.find(params[:id])
    @profiles = Profile.find(params[:id])
  end

  def hollywoodusers
    if user_signed_in?
      @profpic = ProfilePic.where('profile_pics.id' => current_user.id).first
    end
    @user = User.find(params[:id])
    @profiles = Profile.find(params[:id])
  end

  def culvercityusers
    if user_signed_in?
      @profpic = ProfilePic.where('profile_pics.id' => current_user.id).first
    end
    @user = User.find(params[:id])
    @profiles = Profile.find(params[:id])
  end

  def santamonicausers
    if user_signed_in?
      @profpic = ProfilePic.where('profile_pics.id' => current_user.id).first
    end
    @user = User.find(params[:id])
    @profiles = Profile.find(params[:id])
  end

  def pasadenausers
    if user_signed_in?
      @profpic = ProfilePic.where('profile_pics.id' => current_user.id).first
    end
    @user = User.find(params[:id])
    @profiles = Profile.find(params[:id])
  end

  def sanfernandovalleyusers
    if user_signed_in?
      @profpic = ProfilePic.where('profile_pics.id' => current_user.id).first
    end
    @user = User.find(params[:id])
    @profiles = Profile.find(params[:id])
  end

  def venicebeachuser
    if user_signed_in?
      @profpic = ProfilePic.where('profile_pics.id' => current_user.id).first
    end
    @user = User.find(params[:id])
    @profiles = Profile.find(params[:id])
  end

  # GET /profiles/1/edit
  def edit
    if user_signed_in?
      @profpic = ProfilePic.where('profile_pics.id' => current_user.id).first
    end
    @prof = Profile.where("profiles.id" => current_user.id).first
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    if @profile.profile_pic.nil?
      @profile.profile_pic = ProfilePic.new
    end
    #@profilepic = ProfilePic.new(params[:id])
    #@profiledefault = @profilepic.image.blank?
    #if @profiledefault
    #  @profilepic.image = 'default.png'
    #  @profilepic.save
    #end

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:f_name, :l_name,:title, :area, :skills, :fb_url, :angellist_url, :user_id, :profilepicid, :linkedin_url, :meetup_url, :twitter_url,  profile_pic_attributes: [:id, :image])
    end


end
