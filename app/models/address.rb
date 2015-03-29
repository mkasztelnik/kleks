class Address < ActiveRecord::Base
  include Countryable

  validates :address,
            presence: true

  validates :city,
            presence: true

  validates :country,
            presence: true

  validates :postcode,
            presence: true
end
