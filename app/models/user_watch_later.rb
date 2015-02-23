class UserWatchLater < ActiveRecord::Base
  belongs_to :user
  belongs_to :media
end