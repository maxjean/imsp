class Media < ActiveRecord::Base

  require 'streamio-ffmpeg'
  require 'transfer'




  has_many :comments, as: :commentable
  has_one  :media_treatment
  has_and_belongs_to_many :playlists
  has_and_belongs_to_many :events
  belongs_to :user
  belongs_to :system_profil
  belongs_to :media_category
  has_one    :media_treatment
  has_many :bins
  #mount_uploader :video, VideoUploader
  mount_uploader :img, MediaUploader

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  class << self

    def custom_search(query)
      __elasticsearch__.search(query: multi_match_query(query))
    end

    def multi_match_query(query)
      {
          multi_match: {
              query: query,
              fields: ['tags','added_by','authors','title^10', 'description']
          }
      }
    end


  end


  @encoding_state = ['start', 'succeed', 'failed']


  @transcoding_state = ['start', 'succeed', 'failed']
  @upload_state = ['start', 'succeed', 'failed']

  @video_formats = ["1080", "720", "480", "360", "240"]
  @path = ""
  @state
  @current_statut

  def video_process(path)
    #check if video is valid
    video = FFMPEG::Movie.new(path)
    if video.valid? == true

    else

    end
    #if yes => next step
  end

  def self.video_transcode(video_path)

  end



  #trancode video possible format => [1080,720,480,360,240]
  #max transcoding video format == original format encoded

  #transcode different format
  #for each format adapt-resolution & ratio

  #Take 3 screenshots with resolution => "320*240"
  #stock them in video folderlder

  def self.addLikeToUserVideoViews(user, media)
    @user = user.user_video_views.find_by(media_id: media.id)
    @media = Media.find(media.id)
    @user_video_view = user.user_video_views.find_by_media_id(media.id)
    if @user_video_view.like != true
      if @user_video_view.dislike == true
        if @media.like == nil
          @media.like = 1
        elsif @media.like >= 0
          @media.like+=1
        end

        if @media.dislike == nil #impossible
          @media.dislike = 0
        elsif @media.dislike > 0
          @media.dislike-=1
        end
        @user_video_view.dislike = !@user_video_view.dislike
      else
        if @media.like == nil
          @media.like = 1
        elsif @media.like >= 0
          @media.like+=1
        end
      end
      @user_video_view.like = !@user_video_view.like
    else
      @user_video_view.like = !@user_video_view.like
      if @media.like > 0
        @media.like-=1
      end
    end
    @user_video_view.save!
    @media.save!
  end

  def self.addDislikeToUserVideoViews(user, media)
    @user = user.user_video_views.find_by(media_id: media.id)
    @media = Media.find(media.id)
    @user_video_view = user.user_video_views.find_by_media_id(media.id)
    if @user_video_view.dislike != true
      if @user_video_view.like == true
        if @media.dislike == nil
          @media.dislike = 1
        elsif @media.dislike >= 0
          @media.dislike+=1
        end

        if @media.like == nil #impossible
          @media.like = 0
        elsif @media.like > 0
          @media.like-=1
        end
        @user_video_view.like = !@user_video_view.like
      else
        if @media.dislike == nil
          @media.dislike = 1
        elsif @media.dislike >= 0
          @media.dislike+=1
        end
      end
      @user_video_view.dislike = !@user_video_view.dislike
    else
      @user_video_view.dislike = !@user_video_view.dislike
      if @media.dislike > 0
        @media.dislike-=1
      end
    end
    @user_video_view.save!
    @media.save!
  end

  #check if current_media has_alread_been_seen_by_this_user
  def self.addToUserVideoViews(user, media)

    if UserVideoView.find_by(media_id: media.id).nil?

      u = UserVideoView.new(:user_id => user.id, :media_id => media.id, :last_time_seen => Time.now)
      u.save!

      @media = Media.find(media.id)

      if @media.nb_views == nil
        @media.nb_views = 1
        @media.save!
      else
        @media.nb_views = @media.nb_views+=1
        @media.save!
      end
    else
      u = UserVideoView.find_by(media_id: media.id)
      u.last_time_seen = Time.now
      u.save!
    end
  end

  def self.addClientToUserVideoViews(client_ip, media)
    if UserVideoView.find_by(client_ip: client_ip).nil?
      c = UserVideoView.new(:client_ip => client_ip, :media_id => media.id, :last_time_seen => Time.now)
      c.save!

      @media = Media.find(media.id)
      if @media.nb_views == nil
        @media.nb_views = 1
        @media.save!
      else
        @media.nb_views = @media.nb_views+=1
        @media.save!
      end
    else
      u = UserVideoView.find_by(client_ip: client_ip)
      u.last_time_seen = Time.now
      u.save!
    end
  end

  def self.addToPlaylist(playlist, media)
    if playlist.medias.find_by(id: media.id).nil?
      playlist.medias << playlist
    end
  end

  def self.removeFromPlaylist(playlist, media)
    playlist = playlist.medias.find(media.id)

    if playlist
      playlist.medias.delete(playlist) #delete association
    end

  end

  def next_step
    if self.form_step.blank?
      "step1"
    elsif self.form_step == "step1"
      "step2"
    elsif self.form_step == "step2"
      "done"
    else
      raise "internal error!"
    end
  end


end