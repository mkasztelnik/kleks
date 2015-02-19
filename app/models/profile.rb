class Profile < ActiveRecord::Base
  validates :middle_name, presence: true
  validates :date_of_birth, presence: true
  validates :place_of_birth, presence: true
  validates :citizenship, presence: true
  validates :passport_number, presence: true
  validates :passport_date_of_issue, presence: true
  validates :passport_place_of_issue, presence: true
  validates :passport_issuing_agency, presence: true
  validates :country, presence: true

  belongs_to :user, autosave: true

  delegate :first_name, :first_name=, :last_name, :last_name=, to: :user
end
