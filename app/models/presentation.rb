class Presentation < ActiveRecord::Base
  validates :title,
            presence: true

  validates :abstract,
            presence: true,
            length: {
              maximum: 1500,
              too_long: I18n.t('presentation.abstract_to_long')
            }

  validates :keywords,
            presence: true,
            length: {
              maximum: 4,
              tokenizer: lambda { |str| str.split(',') },
              too_long: I18n.t('presentation.keywords_to_long')
            }

  validates :user, presence: true

  belongs_to :user
end
