class User < ActiveRecord::Base
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable,
         :confirmable,
         omniauth_providers: [:facebook, :google_oauth2]

  has_one :profile
  has_one :motivation
  has_one :presentation
  has_one :language
  has_many :educations
  has_many :works

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.first_name || auth.info.given_name
      user.last_name = auth.info.last_name || auth.info.family_name
      user.gender = auth.info.gender
      user.image = auth.info.image
      user.password = Devise.friendly_token[0,20]
      user.confirm!
    end
  end

  def name
    "#{first_name} #{last_name}"
  end
end
