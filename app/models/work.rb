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
            presence: true,
            date: { after: :start_date }

  validates :user,
            presence: true

  belongs_to :user

  def title
    "#{institution} in #{country_name} from #{start_date} to #{end_date}"
  end
end
