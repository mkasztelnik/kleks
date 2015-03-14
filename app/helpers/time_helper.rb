module TimeHelper
  def close_human_date
    cet = ActiveSupport::TimeZone['CET']
    time = Rails.configuration.close_time

    cet.at(time).strftime("%A, %e %b %Y, %H:%M %Z")
  end
end