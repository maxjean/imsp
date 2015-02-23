class Media < ActiveRecord::Base
  has_many :comments, as: :commentable
  belongs_to :user
  belongs_to :system_profil
  belongs_to :media_category
  belongs_to :media_process
end