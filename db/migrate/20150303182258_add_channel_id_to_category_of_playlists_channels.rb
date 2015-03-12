class AddChannelIdToCategoryOfPlaylistsChannels < ActiveRecord::Migration
  def change
    add_column :category_of_playlists_channels, :channel_id, :uuid
  end
end
