json.array!(@category_of_playlists_channels) do |category_of_playlists_channel|
  json.extract! category_of_playlists_channel, :id
  json.url category_of_playlists_channel_url(category_of_playlists_channel, format: :json)
end
