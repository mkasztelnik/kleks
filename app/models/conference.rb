class Conference < ActiveRecord::Base
  extend Enumerize

  PRESENTATION_TYPES = %w(oral poster)

  validates :title,
            presence: true

  validates :address,
            presence: true

  validates :conference_name,
            presence: true

  validates :presentation_type,
            presence: true,
            inclusion: { in:  PRESENTATION_TYPES }

  validates :start_date,
            presence: true,
            date: true

  validates :end_date,
            presence: true,
            date: { after: :start_date }

  belongs_to :user

  enumerize :presentation_type, in: PRESENTATION_TYPES
end
