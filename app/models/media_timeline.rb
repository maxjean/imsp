class MediaTimeline < ActiveRecord::Base
  belongs_to :label
  has_many :bin
end
