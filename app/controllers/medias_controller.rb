class MediasController < ApplicationController
  before_action :set_media, only: [:show, :edit, :update, :destroy]

  def viewing
    @media = Media.find(params[:m])

    if params[:plist]
      @playlist = Playlist.find(params[:plist])
    else
      @playlist = nil
    end


    if current_user
      Media.addToUserVideoViews(current_user, @media)
    else
      client_ip = request.remote_ip
      Media.addClientToUserVideoViews(client_ip, @media)
    end

    if params[:media_like_button]
      if !current_user.nil?
        Media.addLikeToUserVideoViews(current_user,@media)
      end
    end

    if params[:media_dislike_button]
      if !current_user.nil?
        Media.addDislikeToUserVideoViews(current_user,@media)
      end
    end
  end
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
      video = FFMPEG::Movie.new(@media.video.file.file)
      if video.valid? == true

        video.transcode("./public/uploads/media/video/#{@media.id}/#{@media.id}_640x360.mp4") {|progress| puts progress}
        3.times do |x| video.screenshot("./public/uploads/media/video/#{@media.id}/#{@media.id}_#{x}.png", seek_time: "#{x+=10}", resolution: '320x240') end

        upload = Transfer.upload("","","","./public/uploads/media/video/#{@media.id}", '/usr/local/nginx/html/imsp')
        system("rm -rf ./public/uploads/media/video/#{@media.id}")
      else
        @media.form_step == "step1"
      end

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
