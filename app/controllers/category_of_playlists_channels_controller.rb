class CategoryOfPlaylistsChannelsController < ApplicationController
  before_action :set_category_of_playlists_channel, only: [:show, :edit, :update, :destroy]

  # GET /category_of_playlists_channels
  # GET /category_of_playlists_channels.json
  def index
    @category_of_playlists_channels = CategoryOfPlaylistsChannel.all
  end

  # GET /category_of_playlists_channels/1
  # GET /category_of_playlists_channels/1.json
  def show
    set_category_of_playlists_channel
  end

  # GET /category_of_playlists_channels/new
  def new
    @category_of_playlists_channel = CategoryOfPlaylistsChannel.new
  end

  # GET /category_of_playlists_channels/1/edit
  def edit
  end

  # POST /category_of_playlists_channels
  # POST /category_of_playlists_channels.json
  def create
    @category_of_playlists_channel = CategoryOfPlaylistsChannel.new(category_of_playlists_channel_params)

    respond_to do |format|
      if @category_of_playlists_channel.save
        format.html { redirect_to @category_of_playlists_channel, notice: 'Category of playlists channel was successfully created.' }
        format.json { render :show, status: :created, location: @category_of_playlists_channel }
      else
        format.html { render :new }
        format.json { render json: @category_of_playlists_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_of_playlists_channels/1
  # PATCH/PUT /category_of_playlists_channels/1.json
  def update
    respond_to do |format|
      if @category_of_playlists_channel.update(category_of_playlists_channel_params)
        format.html { redirect_to @category_of_playlists_channel, notice: 'Category of playlists channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @category_of_playlists_channel }
      else
        format.html { render :edit }
        format.json { render json: @category_of_playlists_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_of_playlists_channels/1
  # DELETE /category_of_playlists_channels/1.json
  def destroy
    @category_of_playlists_channel.destroy
    respond_to do |format|
      format.html { redirect_to category_of_playlists_channels_url, notice: 'Category of playlists channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_of_playlists_channel
      @category_of_playlists_channel = CategoryOfPlaylistsChannel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_of_playlists_channel_params
      params.require(:category_of_playlists_channel).permit!
    end
end
