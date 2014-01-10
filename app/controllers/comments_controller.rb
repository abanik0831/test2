class CommentsController < ApplicationController
  #before_action :set_comment, only: [:show, :edit, :update, :destroy]

  before_filter :load_article
  # GET /comments
  # GET /comments.json
  #def index
  #  @comments = Comment.all
  #end

  def index
    @comments = @post.comments
    @limitcomments = Comment.where(post_id: 1).limit(2).order("id DESC").reverse

  end

  def create
    @useragent = request.env["HTTP_USER_AGENT"]

    @postsall = Post.all
    # @comment = @post.comments.build(params[:comment])
    @comment = @post.comments.create(params[:comment])
    PrivatePub.publish_to("/profiles/1", comment: @comment)
    #if @comment.save
    #  redirect_to(:controller => "/splash_screen", :action => "index")
    #else
    #  render :newa
    #end

    respond_to do |format|
      format.html { redirect_to(:controller => "/splash_screen", :action => "index") }
      format.js
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def load_article
    @postsall = Post.all
    @post = Post.find(params[:post_id])

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:cmtpost, :user_id, :comment_visibility, :post_id, :profile_id)
  end
end
