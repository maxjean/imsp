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
  mount_uploader :video, VideoUploader

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