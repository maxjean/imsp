class Label < ActiveRecord::Base
  belongs_to :bin
  has_many :media_timelines
end