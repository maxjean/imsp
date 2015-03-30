class Bin < ActiveRecord::Base
  belongs_to :event
  has_many :documents
  has_many :labels

  validates_presence_of :event_id
  validates_presence_of :title
end