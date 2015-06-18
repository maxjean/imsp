class CategoryOfPlaylistsChannel < ActiveRecord::Base
  belongs_to :channel
  has_and_belongs_to_many :playlists
  mount_uploader :cover, CategoryOfPlaylistsChannelUploader

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

  def self.userSelectedCategories(user_channel)
    category_of_playlists_channels_playlists = []
    user_channel.category_of_playlists_channels.map{|c|c.playlists.map{|x|category_of_playlists_channels_playlists << [{:playlist_id => x.id, :categories_ids => [x.category_of_playlists_channel_ids]}]}}
    return category_of_playlists_channels_playlists
  end

end
