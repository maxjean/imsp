class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  respond_to :json

  def channel
    @user = User.find(params[:user_id])
    @channel = @user.channel
    @playlist_categories = @channel.category_of_playlists_channels
    session[:category_plist_channel] = @channel.category_of_playlists_channels

    respond_to do |format|
      format.html
      format.json { render json: @playlist_categories }
    end
  end

  def videos
    @user_videos = User.find(params[:user_id]).medias
    @user = User.find(params[:user_id])
  end

  def about
    @user = User.find(params[:user_id])
  end

  def comments
    @user = User.find(params[:user_id])
    #@user_videos = User.find(params[:id]).channel.comments
    #@user_videos = User.find(params[:id]).comments
  end

  def category_plist_channels_api
    @category_plist_channel = session[:category_plist_channel]
    render :json => @category_plist_channel
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @channel = User.find(params[:id]).channel
    @playlist_categories = @channel.category_of_playlists_channels
    session[:category_plist_channel] = @channel.category_of_playlists_channels

    respond_to do |format|
        format.html
        format.json { render json: @playlist_categories }
    end
  end



  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.provider = "imsp"
    @user.name = "#{params[:user][:firstname].capitalize} #{params[:user][:lastname].capitalize}"
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

    def user_params
      params.require(:user).permit!
    end
end
