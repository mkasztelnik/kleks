class Conference < ActiveRecord::Base
  extend Enumerize
  include Countryable

  PRESENTATION_TYPES = %w(oral poster)

  validates :title,
            presence: true

  validates :country,
            presence: true

  validates :conference_name,
            presence: true

  validates :presentation_type,
            presence: true,
            inclusion: { in:  PRESENTATION_TYPES }

  validates :year,
            presence: true,
            numericality: {
              only_integer: true,
              less_than_or_equal_to: Time.now.year
            }

  belongs_to :user

  enumerize :presentation_type, in: PRESENTATION_TYPES
end
