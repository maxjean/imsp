class MediaTimeline < ActiveRecord::Base
  belongs_to :label
  belongs_to :bin
end
