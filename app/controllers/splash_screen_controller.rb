class SplashScreenController < ApplicationController
  def new
    @request_user = Request.new
  end

    def index
      if user_signed_in?
        @profpic = ProfilePic.where('profile_pics.id' => current_user.id).first
      end
      if user_signed_in?
        @post = Post.where(:profile_id => current_user.id).order("created_at DESC").all
        @postpic = PostPic.order("created_at DESC").all

        # @postpic = PostPic.where(:)
      @post_pic = PostPic.new

      #@post_pic.build_splash_screen
      @post_pic.profile_id = current_user.id
     # @newpic = PostPic.new(params[@post_pic])
      @postnew = Post.new
      @profile = Profile.new
      @user = User.new
      @postnew.build_post_pic
      #@postnew.post_pics.build
      @comment = @postnew.comments.build
      @profilepic = ProfilePic.all
     # @Postvisibility = Post.find(params[:id])
     # @Postvisibility = Post.where("posts.id" => 130).first
      @Postvisibility = Post.all
      @dash_post = Post.joins("INNER JOIN relationships ON relationships.followed_id = Posts.profile_id").where(:relationships => {:follower_id => current_user.id})

      @dash_pic = ProfilePic.joins("INNER JOIN relationships ON relationships.followed_id = profile_pics.profile_id").where(:relationships => {:follower_id => current_user.id})

      @dash_post_array = (@dash_post.to_a + @post.to_a)

      @dash_pic_array = @dash_pic.to_a.sort_by { |obj| obj.created_at }.reverse!

      @dash_post_array_sorted = @dash_post_array.sort_by { |obj| obj.created_at }
      @dash_post_array_sorted_reverse = @dash_post_array_sorted.reverse!

      @crntuser = Profile.where("profiles.id" => current_user.id).first
      @commentdisplay = Comment.all
      @deleteposts = @postnew.deleteposts.build
      #@deletepostscheck = Deletepost.where("deleteposts.post_id" => "169").first
        gb = Gibbon::API.new("e944455757266e34f5fff9d53f2c6e8c-us3")
        #@lists = gb.lists({:start => 0, :limit=> 100})["data"]
        @lists = gb.lists.list({:start => 0, :limit=> 100})

        #@post.profile_id = current_user.id
      end
    end
      #@post.save

  #def create
  #  @post = Post.new(params[:post])
  #  if @post.save
  #    render :nothing => true
  #  end
  #
  #end

  def create
    @post_pic = PostPic.create(params[:post_pic])
  end


  def article_params
    params.permit(:post_pic, :profile_id)
  end

end
