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

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_one  :profile,      dependent: :destroy
  has_one  :motivation,   dependent: :destroy
  has_one  :presentation, dependent: :destroy
  has_one  :language,     dependent: :destroy
  has_many :educations,   dependent: :destroy
  has_many :works,        dependent: :destroy
  has_many :conferences,  dependent: :destroy
  has_many :others,       dependent: :destroy
  has_many :publications, dependent: :destroy
  has_many :trainings,    dependent: :destroy

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

  def academic_count
    conferences.count + others.count + publications.count + trainings.count
  end

  def application_ready?
    profile && motivation && presentation &&
      language && educations.count > 0
  end
end
