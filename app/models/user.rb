class User < ActiveRecord::Base
  has_one :channel
  has_many :events
  has_many :user_subscriptions
  has_many :playlists
  has_one :user_about
  has_many :comments
  has_many :medias
  has_many :user_on_hold_videos
  has_many :user_video_views
end