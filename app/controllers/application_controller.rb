class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  before_action :configure_permitted_parameters, if: :devise_controller?

=begin
  before_filter :set_access_control_headers
=end
  def search
=begin
    if params[:query]
      @medias = Media.where("title like ?", "%#{params[:query]}")
    end
=end
    #@medias= Media.search(query: {multi_match: {query: params[:query], fields: ['tags','added_by','authors','title^10', 'description']}}).records
    @results = []
    results_medias = []
    results_playlists = []
    results_channels = []
    rt = {"medias"=>[],"playlists" =>[],"channels"=>[]}


    medias= Media.custom_search((params[:query].present? ? params[:query] : '*')).records
    channels= Channel.custom_search((params[:query].present? ? params[:query] : '*')).records
    playlists= Playlist.custom_search((params[:query].present? ? params[:query] : '*')).records

    results_medias << medias.records.all
    results_channels << channels.records.all
    results_playlists << playlists.records.all
    results_medias[0].each do|rm| rt["medias"] << { "id"=> rm.id, "title" => rm.title, "authors" => rm.authors, "file" => rm.file, "duration" => rm.duration, "added_by" => rm.added_by, "img" => rm.img, "created_at" => rm.created_at, "description" => rm.description, "nb_views" => rm.nb_views } end
    results_channels[0].each do|rc| rt["channels"] << { "id"=> rc.id, "title" => rc.title, "presentation_text" => rc.presentation_text, "cover" => rc.cover, "created_at" => rc.created_at } end
    results_playlists[0].each do|rp| rt["playlists"] << { "id"=> rp.id, "title" => rp.title,  "cover" => rp.cover, "created_at" => rp.created_at } end

    @results << rt
  end

  def home
  end

  def content

  end

  def channel
  end
  protected

  def current_user_channel
    current_user.channel
  end

  def current_user_category_of_playlists
    current_user_channel.category_of_playlists_channels
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :pseudo
    devise_parameter_sanitizer.for(:sign_in) << :pseudo
    devise_parameter_sanitizer.for(:account_update) << :pseudo
  end

  def set_access_control_headers
    response.headers["Access-Control-Allow-Origin"] = "*"
  end



  helper_method :current_user_channel, :current_user_category_of_playlists
end
