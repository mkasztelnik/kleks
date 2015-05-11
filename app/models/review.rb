class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :reviewer,
             class_name: 'User',
             foreign_key: 'reviewer_id'

  has_one :general,      through: :user
  has_one :profile,      through: :user
  has_one :motivation,   through: :user
  has_one :presentation, through: :user
  has_one :language,     through: :user
  has_many :educations,   through: :user
  has_many :works,        through: :user
  has_many :conferences,  through: :user
  has_many :others,       through: :user
  has_many :publications, through: :user
  has_many :trainings,    through: :user

  def score
    if ready?
      @score ||= motivation_score + presentation_score + education_score +
                 academic_score + work_score + language_score
    end
  end

  private

  def ready?
    motivation_score && presentation_score && education_score &&
      academic_score && work_score && language_score
  end
end
