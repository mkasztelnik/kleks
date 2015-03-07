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
            date: { after: :start_date }

  belongs_to :user,
             required: true

  def title
    "#{institution} in #{country_name} from #{start_date} to #{end_date}"
  end
end
