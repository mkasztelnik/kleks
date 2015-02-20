class Education < ActiveRecord::Base
  belongs_to :user

  def title
    "#{education_type} #{program_name}"
  end

  def country_name
    c = ISO3166::Country[country]
    c.translations[I18n.locale.to_s] || c.name
  end
end
