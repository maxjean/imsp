class Bin < ActiveRecord::Base
  belongs_to :event
  has_many :documents
  has_many :labels
  has_many :media_timelines
  belongs_to :media

  validates_presence_of :event_id
  validates_presence_of :title
  accepts_nested_attributes_for :media_timelines

  def media_timeline_attributes=(media_timeline_attributes)
    media_timeline_attributes.each do |attributes|
      media_timelines.build(attributes)
    end
  end
end