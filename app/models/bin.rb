class Bin < ActiveRecord::Base
  belongs_to :event
  has_many :documents
  has_many :labels
  belongs_to :media_timeline

  validates_presence_of :event_id
  validates_presence_of :title
end