class MediaTimeline < ActiveRecord::Base
  belongs_to :bin
  belongs_to :label
  belongs_to :document
end
