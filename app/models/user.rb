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

  has_one  :general,      dependent: :destroy
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

  has_many :reviews,
           dependent: :destroy

  has_many :application_reviews,
           dependent: :nullify,
           class_name: 'Review',
           foreign_key: 'reviewer_id'

  scope :applicants, -> { where(reviewer: false) }
  scope :submitted, -> { where(submitted: true) }
  scope :reviewers, -> { where(reviewer: true) }

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do |user|
      fail RegistrationClosed if user.new_record? && !Kleks.open?

      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.first_name || auth.info.given_name
      user.last_name = auth.info.last_name || auth.info.family_name
      user.gender = auth.info.gender
      user.image = auth.info.image
      user.password = Devise.friendly_token[0, 20]
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
    ready?(general) && ready?(profile) && ready?(motivation) &&
      ready?(presentation) && language && educations.count > 0
  end

  def ready?(element)
    element && !element.new_record?
  end

  def score
    if reviews_ready?
      @score ||= calculate_score
    end
  end

  def to_s
    name
  end

  private

  def calculate_score
    count = 0
    sum = reviews.inject(0) do |s, review|
      count += 1
      s + review.score
    end

    (sum.to_f / count).round(2) if count > 0
  end

  def reviews_ready?
    !reviews.detect { |r| r.score.nil? }
  end
end
