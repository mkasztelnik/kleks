class Language < ActiveRecord::Base
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
            if: :certificate

  validates :certificate_score,
            presence: true,
            if: :certificate

  validates :other_description,
            presence: true,
            if: :other

  belongs_to :user
end
