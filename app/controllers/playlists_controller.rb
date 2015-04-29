class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  # GET /playlists
  # GET /playlists.json
  def index
    @playlists = current_user.playlists
    respond_to do |format|
      format.html { render :index }
      format.json { render json: {:selected_categories => CategoryOfPlaylistsChannel.userSelectedCategories(current_user_channel)}}
    end

  end

  # GET /playlists/1
  # GET /playlists/1.json
  def show
    set_playlist
    @playlists = current_user.playlists

  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
  end

  # GET /playlists/1/edit
  def edit
  end

  # POST /playlists
  # POST /playlists.json
  def create
    @playlist = current_user.playlists.new(playlist_params)

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to @playlist, notice: 'Playlist was successfully created.' }
        format.json { render :show, status: :created, location: @playlist }
      else
        format.html { render :new }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playlists/1
  # PATCH/PUT /playlists/1.json
  def update

    if request.xhr?
      category_ids = params[:category_ids]
      category_ids.each do |c|
        @category = CategoryOfPlaylistsChannel.find(c)
        @playlist = Playlist.find(params[:id])

        if @category.playlists.find_by(id: @playlist.id).nil?
          CategoryOfPlaylistsChannel.addPlaylist(@category,@playlist)
        else
          CategoryOfPlaylistsChannel.removePlaylist(@category,@playlist)
        end

      end

      render :nothing => true
    else
      respond_to do |format|
        if @playlist.update(playlist_params)
          format.html { redirect_to @playlist, notice: 'Playlist was successfully updated.' }
          format.json { render :show, status: :ok, location: @playlist }
        else
          format.html { render :edit }
          format.json { render json: @playlist.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url, notice: 'Playlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  def playlist_params
    params.require(:playlist).permit!
  end
end
