class Language < ActiveRecord::Base
  extend Enumerize

  LEVELS = %w(A1 A2 B1 B2 C1 C2)

  validates :understanding_level,
            presence: true,
            inclusion: { in: LEVELS }

  validates :speaking_level,
            presence: true,
            inclusion: { in: LEVELS }

  validates :writing_level,
            presence: true,
            inclusion: { in: LEVELS }


  validates :study_program,
            presence: true,
            if: :study

  validates :study_url,
            presence: true,
            if: :study

  validates :certificate_name,
            presence: true,
            if: :certificate

  validates :certificate_year,
            presence: true,
            numericality: {
              only_integer: true,
              less_than_or_equal_to: Time.now.year
            },
            if: :certificate

  validates :certificate_score,
            presence: true,
            if: :certificate

  validates :other_description,
            presence: true,
            if: :other

  validate :at_least_one_expertise

  belongs_to :user

  enumerize :understanding_level, in: LEVELS
  enumerize :speaking_level, in: LEVELS
  enumerize :writing_level, in: LEVELS

  def at_least_one_expertise
    unless native || study || certificate || other
      msg = I18n.t('language.one_expertise_needed')
      errors.add(:native, msg)
      errors.add(:study, msg)
      errors.add(:certificate, msg)
      errors.add(:other, msg)
    end
  end
end
