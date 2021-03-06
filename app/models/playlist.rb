class Playlist < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :category_of_playlists_channels
  has_and_belongs_to_many :events
  has_and_belongs_to_many :medias

  def self.addMedia(playlist, media)
    if playlist.medias.find_by(id: playlist.id).nil?
      playlist.medias << media
    end
  end

  def self.removeMedia(playlist, media)
    selected_playlist = playlist.find(playlist.id)

    if selected_playlist
      playlist.medias.delete(selected_playlist) #delete association
    end
  end
end