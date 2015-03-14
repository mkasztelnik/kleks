class Work < ActiveRecord::Base
  include Countryable

  validates :institution,
            presence: true

  validates :responsibility,
            presence: true

  validates :country,
            presence: true

  validates :start_date,
            presence: true,
            date: true

  validates :end_date,
            date: { after: :start_date },
            if: :end_date

  belongs_to :user,
             required: true

  def dates
    msg = "from #{start_date}"
    msg = "#{msg} to #{end_date}" if end_date

    msg
  end
end
