class Publication < ActiveRecord::Base
  validates :publication_title,
            presence: true

  validates :authors,
            presence: true

  validates :year,
            presence: true

  validates :language,
            presence: true

  validates :user,
            presence: true

  belongs_to :user
end
