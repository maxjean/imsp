class MediasController < ApplicationController
  before_action :set_media, only: [:show, :edit, :update, :destroy]

  # GET /medias
  # GET /medias.json
  def index
    @medias = current_user.medias
  end

  # GET /medias/1
  # GET /medias/1.json
  def show
  end

  # GET /medias/new
  def new
    @media = Media.new
  end

  # GET /medias/1/edit
  def edit
    @media = Media.find(params[:id])
  end

  # POST /medias
  # POST /medias.json
  def create
    @media = current_user.medias.new(media_params)
    if @media.save
      redirect_to edit_media_path @media
    else
      render :new
    end
  end

  # PATCH/PUT /medias/1
  # PATCH/PUT /medias/1.json
  def update
    @media = Media.find(params[:id])
    if @media.update_attributes(media_params)
      if @media.form_step == "step2"
        redirect_to medias_path
      else
        redirect_to edit_media_path @media
      end
    end

  end

  # DELETE /medias/1
  # DELETE /medias/1.json
  def destroy
    @media.destroy
    respond_to do |format|
      format.html { redirect_to medias_url, notice: 'Media was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_media
      #@media = Media.find(params[:channel_id])
      @media = Media.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def media_params
      params.require(:media).permit!
    end
end
