class Label < ActiveRecord::Base
  belongs_to :bin
  has_many :media_timelines
  has_many :labels_users_answers
  mount_uploader :img, LabelUploader






end