class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :channel
  has_many :events
  has_many :user_subscriptions
  has_many :playlists
  has_one :user_about
  has_many :comments
  has_many :medias
  has_many :user_on_hold_videos
  has_many :user_video_views
  has_many :authorizations

  attr_accessor :password
  before_save :encrypt_password

  def self.validates_datas
    validates_confirmation_of :password
    validates_presence_of :password, :on => :create
    validates_presence_of :firstname
    validates_presence_of :lastname
    validates_presence_of :email
    validates_uniqueness_of :email
  end

  def self.authenticate(email, password)
    validates_datas
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

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
      user.save!
    end
  end

end