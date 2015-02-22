class Education < ActiveRecord::Base
  include Countryable

  validates :education_type,
            presence: true,
            inclusion: { in: %w(ba ma phd) }

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

  def title
    "#{education_type} #{program_name}"
  end
end
