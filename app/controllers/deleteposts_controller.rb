class DeletepostsController < ApplicationController
  before_action :set_deletepost, only: [:show, :edit, :update, :destroy]

  # GET /deleteposts
  # GET /deleteposts.json
  def index
    @deleteposts = Deletepost.all
  end

  # GET /deleteposts/1
  # GET /deleteposts/1.json
  def show
  end

  # GET /deleteposts/new
  def new
    @deletepost = Deletepost.new
  end

  # GET /deleteposts/1/edit
  def edit
  end

  # POST /deleteposts
  # POST /deleteposts.json
  def create
    @deletepost = Deletepost.new(deletepost_params)

    respond_to do |format|
      if @deletepost.save
        format.html { redirect_to @deletepost, notice: 'Deletepost was successfully created.' }
        format.json { render action: 'show', status: :created, location: @deletepost }
      else
        format.html { render action: 'new' }
        format.json { render json: @deletepost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deleteposts/1
  # PATCH/PUT /deleteposts/1.json
  def update
    respond_to do |format|
      if @deletepost.update(deletepost_params)
        format.html { redirect_to @deletepost, notice: 'Deletepost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @deletepost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deleteposts/1
  # DELETE /deleteposts/1.json
  def destroy
    @deletepost.destroy
    respond_to do |format|
      format.html { redirect_to deleteposts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deletepost
      @deletepost = Deletepost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deletepost_params
      params.require(:deletepost).permit(:post_id, :user_id)
    end
end
