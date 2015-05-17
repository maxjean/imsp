class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  before_action :configure_permitted_parameters, if: :devise_controller?

=begin
  before_filter :set_access_control_headers
=end

  def home
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
