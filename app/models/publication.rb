class Publication < ActiveRecord::Base
  validates :publication_title,
            presence: true

  validates :authors,
            presence: true

  validates :year,
            presence: true,
            numericality: {
              only_integer: true,
              less_than_or_equal_to: Time.now.year
            }


  validates :language,
            presence: true

  validates :user,
            presence: true

  belongs_to :user
end
