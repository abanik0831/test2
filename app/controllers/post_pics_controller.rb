class PostPicsController < ApplicationController
  before_action :set_post_pic, only: [:show, :edit, :update, :destroy]

  # GET /post_pics
  # GET /post_pics.json
  def index
    @post_pics = PostPic.all
  end

  # GET /post_pics/1
  # GET /post_pics/1.json
  def show
  end

  # GET /post_pics/new
  #def new
  #  @post_pic = PostPic.new
  #end

  # GET /post_pics/1/edit
  def edit
  end

  # POST /post_pics
  # POST /post_pics.json
  #def create
  # # @post_pic = PostPic.new(post_pic_params)
  #
  #  #respond_to do |format|
  #  #  format.js
  #  #end
  #
  #end

  def create
    @post_pic = PostPic.create(params[:post_pic])
  end

  # PATCH/PUT /post_pics/1
  # PATCH/PUT /post_pics/1.json
  def update
    respond_to do |format|
      if @post_pic.update(post_pic_params)
        format.html { redirect_to @post_pic, notice: 'Post pic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post_pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_pics/1
  # DELETE /post_pics/1.json
  def destroy
    @post_pic.destroy
    respond_to do |format|
      format.html { redirect_to post_pics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_pic
      @post_pic = PostPic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_pic_params
      params.require(:post_pic).permit(:post_id, :profile_id,:picture)
    end
end
