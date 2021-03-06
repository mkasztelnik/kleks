class Profile < ActiveRecord::Base
  include Countryable

  GENDER_TYPES = %w(Male Female)

  validates :date_of_birth,
            presence: true,
            date: {
              before: Proc.new { 18.years.ago }
            }

  validates :place_of_birth,
            presence: true

  validates :citizenship,
            presence: true

  validates :passport_number,
            presence: true,
            if: :need_visa

  validates :country,
            presence: true

  validates :first_name,
            presence: true

  validates :last_name,
            presence: true

  validates :gender,
            presence: true,
            inclusion: { in:  GENDER_TYPES }

  belongs_to :user,
             required: true,
             autosave: true

  belongs_to :address,
             required: true,
             autosave: true,
             dependent: :destroy

  accepts_nested_attributes_for :address

  delegate :first_name, :first_name=,
           :last_name, :last_name=,
           :gender, :gender=,
           :email,
           to: :user
end
