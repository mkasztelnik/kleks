class Education < ActiveRecord::Base
  extend Enumerize

  EDUCATION_TYPES = %w(ba ma phd)

  validates :education_type,
            presence: true,
            inclusion: { in:  EDUCATION_TYPES }

  validates :start_date,
            presence: true,
            date: true

  validates :end_date,
            presence: true,
            date: { after: :start_date }

  validates :university_name,
            presence: true

  validates :program_name,
            presence: true

  validates :country,
            presence: true

  validates :user,
            presence: true

  belongs_to :user

  enumerize :education_type, in: EDUCATION_TYPES

  def title
    "#{education_type_text} #{program_name}"
  end
end
