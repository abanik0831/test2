class CommentsController < ApplicationController
  #before_action :set_comment, only: [:show, :edit, :update, :destroy]

  before_filter :load_article
  # GET /comments
  # GET /comments.json
  #def index
  #  @comments = Comment.all
  #end

  def index
    @postsall = Post.all
    @comments = @post.comments
  end

  def create
    @postsall = Post.all
    @comment = @post.comments.build(params[:comment])
    if @comment.save
      redirect_to(:controller => "/splash_screen", :action => "index")
    else
      render :new
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
