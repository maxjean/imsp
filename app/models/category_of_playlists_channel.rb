class CategoryOfPlaylistsChannel < ActiveRecord::Base
  belongs_to :channel
  has_and_belongs_to_many :playlists

  def self.addPlaylist(playlists_category, playlist)
    if playlists_category.playlists.find_by(id: playlist.id).nil?
      playlists_category.playlists << playlist
    end
  end

  def self.removePlaylist(category_of_playlist, playlist)
    category = category_of_playlist.playlists.find(playlist.id)

    if category
      category_of_playlist.playlists.delete(category) #delete association
    end

  end

  def self.clearAllPlaylists(category_of_playlist)
    category_of_playlist.playlists.clear
  end

end