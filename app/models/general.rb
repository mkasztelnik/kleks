class General < ActiveRecord::Base
  belongs_to :user,
             required: true

  validates :accept,
            acceptance: { accept: true}

  validates :accept_travel,
            acceptance: { accept: true}

  validates :accept_insurance,
            acceptance: { accept: true}

  validate :at_least_one_know_from

  private

  def at_least_one_know_from
    unless know_from_ces_www || know_from_ces_facebook || know_from_facebook ||
      know_from_newsletter || !other_websites.blank? || know_from_leaflet ||
      know_from_friends || !other.blank?
      msg = I18n.t('general.one_know_from_needed')
      errors.add(:know_from_ces_www, msg)
      errors.add(:know_from_ces_facebook, msg)
      errors.add(:know_from_facebook, msg)
      errors.add(:know_from_newsletter, msg)
      errors.add(:other_websites, msg)
      errors.add(:know_from_leaflet, msg)
      errors.add(:know_from_friends, msg)
      errors.add(:other, msg)
    end
  end
end
