class User < ActiveRecord::Base
  has_one :channel
  has_many :events
  has_many :user_subscriptions
  has_many :playlists
  has_one  :user_about
  has_many :comments, as: :commentable
  has_many :medias
  has_many :user_on_hold_videos
  has_many :user_video_views
  has_many :authorizations

  validates_presence_of :pseudo
  validates_uniqueness_of :pseudo

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.from_omniauth(auth)
    Rails.logger.debug {"FROM_OMNIAUTH::auth => #{auth.inspect}"}
    where(:uid => auth.uid).first_or_initialize do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.firstname = auth.info.first_name
      user.lastname = auth.info.last_name
      user.email = auth.info.email
      user.cover = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at) if auth.provider == "facebook"
     # user.save! unless !nil?  #TODO LATER!!!!!!!
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def email_required?
    super && provider.blank?
  end
end
