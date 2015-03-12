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

  def self.userSelectedCategories(user_channel)
    category_of_playlists_channels_playlists = []
    user_channel.category_of_playlists_channels.first.playlists.map{|x|category_of_playlists_channels_playlists << [{:playlist_id => x.id, :categories_ids => [x.category_of_playlists_channel_ids]}]}
    #user_channel.category_of_playlists_channels.each{|category|category.playlists.map{|x|category_of_playlists_channels_playlists.merge!({:playlist_id => x.id, :categories_ids => [x.category_of_playlists_channel_ids]})}}
    #current_user_channel.category_of_playlists_channels.each{|category|category.playlists.map{|t|a << [t.id, t.category_of_playlists_channel_ids]}}
    return category_of_playlists_channels_playlists
  end

end
