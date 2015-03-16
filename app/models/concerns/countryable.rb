module Countryable
  extend ActiveSupport::Concern

  def country_name
    unless country.blank?
      c = ISO3166::Country[country]
      c.translations[I18n.locale.to_s] || c.name
    end
  end
end