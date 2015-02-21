class Work < ActiveRecord::Base
  include Countryable

  belongs_to :user

  def title
    "#{institution} in #{country_name} from #{start_date} to #{end_date}"
  end
end
