class Training < ActiveRecord::Base
  include Countryable

  validates :title,
            presence: true

  validates :institution,
            presence: true

  validates :start_date,
              presence: true,
              date: true

  validates :end_date,
            presence: true,
            date: { after_or_equal_to: :start_date }

  belongs_to :user,
             required: true
end
