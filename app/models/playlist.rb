class Playlist < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :category_of_playlists_channels
  has_and_belongs_to_many :events
  has_and_belongs_to_many :medias
end