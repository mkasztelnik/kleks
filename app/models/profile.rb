class Profile < ActiveRecord::Base
  GENDER_TYPES = %w(Male Female)

  validates :date_of_birth,
            presence: true,
            date: true

  validates :place_of_birth,
            presence: true

  validates :citizenship,
            presence: true

  validates :passport_number,
            presence: true

  validates :passport_date_of_issue,
            presence: true,
            date: true

  validates :passport_place_of_issue,
            presence: true

  validates :passport_issuing_agency,
            presence: true

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
