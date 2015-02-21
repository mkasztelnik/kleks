class Education < ActiveRecord::Base
  include Countryable

  belongs_to :user

  def title
    "#{education_type} #{program_name}"
  end
end
