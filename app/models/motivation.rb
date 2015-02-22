class Motivation < ActiveRecord::Base
  validates :text,
            presence: true,
            length: {
              maximum: 2500,
              too_long: I18n.t('motivation.to_long')
            }

  validates :user, presence: true

  belongs_to :user
end
