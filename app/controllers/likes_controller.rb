class LikesController < ApplicationController


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
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(params[:like])

    respond_to do |format|
      if @like.save 
        
        format.html { redirect_to(:controller => "/splash_screen", :action => "index") }
        format.js
      else
        format.js {render :partial=> 'not_saved' , :notice => 'like is not saved'}
      end
           
    end


    #@comment = @post.comments.build(params[:comment])
    #@like = @post.likes.create(params[:like])
    #if @comment.save
    #  redirect_to(:controller => "/splash_screen", :action => "index")
    #else
    #  render :new
    #end

    # respond_to do |format|
    #   format.html { redirect_to(:controller => "/splash_screen", :action => "index") }
    #   format.js
    # end


  end



  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find(params[:id])

    respond_to do |format|
      if @like.destroy
        format.js {render :partial=> 'delete'}
      else
        format.js {render :partial=> 'nodelete'}
      end
    end

  end 


  private
  # Use callbacks to share common setup or constraints between actions.

  def load_article
    @postsall = Post.all
    #@post = Post.find(params[:post_id])

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:like).permit(:user_id, :post_id)
  end




end
