class Encoder
  require 'streamio-ffmpeg'
  require 'fileutils'

  @video
  @videoErr

  def self.EncodeVideo(path)
    @video = FFMPEG::Movie.new(path)
  end

  def self.getEncodedVideoDatas
     return p @video
  end

  def self.setErrors(errors)
    @videoErr = errors
  end

  def self.getVideoErrors
    return @videoErr
  end


end






