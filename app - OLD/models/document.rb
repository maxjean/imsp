class Document < ActiveRecord::Base
  belongs_to :bin
  has_many :media_timelines
  mount_uploader :file, DocumentUploader
end