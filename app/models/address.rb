class Address < ActiveRecord::Base
  validates :address,
            presence: true

  validates :city,
            presence: true

  validates :country,
            presence: true

  validates :state,
            presence: true

  validates :postcode,
            presence: true
end
