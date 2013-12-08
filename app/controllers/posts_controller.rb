class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show

  end

  # GET /posts/new
  def new
    #@post = Post.new
    #@post.build_profiles
    #@post.profile_id = Post
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    #@post_pic = PostPic.create(params[:post_pic])
    @post = Post.new(post_params)
      respond_to do |format|
       if @post.save
         format.html {redirect_to(:controller => "/splash_screen", :action => "index")}
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
   # respond_to do |format|
    @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to(:controller => "/splash_screen", :action => "index")
      end
      #  format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      #  format.json { head :no_content }
      #else
      #  format.html { render action: 'edit' }
      #  format.json { render json: @post.errors, status: :unprocessable_entity }
      #end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:post, :profile_id, :visibility, :profileid_del, :cmtpost, :post_id, :user_id, :comment_visibility, :post_pic_attributes => [:picture, :profile_id])
    end
end
