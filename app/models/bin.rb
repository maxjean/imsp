class Bin < ActiveRecord::Base
  belongs_to :event
  has_many :documents
  has_many :labels
end