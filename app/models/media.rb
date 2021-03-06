class Media < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_one  :media_treatment
  has_and_belongs_to_many :playlists
  has_and_belongs_to_many :events
  belongs_to :user
  belongs_to :system_profil
  belongs_to :media_category
  has_one    :media_treatment

  def next_step
    if self.form_step.blank?
      "step1"
    elsif self.form_step == "step1"
      "step2"
    elsif self.form_step == "step2"
      "done"
    else
      raise "internal error!"
    end
  end
end