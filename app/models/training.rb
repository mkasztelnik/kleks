class Training < ActiveRecord::Base
  include Countryable

  validates :institution,
            presence: true

  validates :gained_experience,
            presence: true

  validates :start_date,
              presence: true,
              date: true

  validates :end_date,
            presence: true,
            date: { after: :start_date }

  belongs_to :user,
             required: true
end
