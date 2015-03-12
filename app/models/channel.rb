class Channel < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :category_of_playlists_channels
  belongs_to :user
end