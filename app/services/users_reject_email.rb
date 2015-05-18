class UsersRejectEmail
  def initialize(treshold)
    @treshold = treshold
  end

  def execute
    User.ranking.select { |u| (u.score || 0) <= @treshold }.each do |applicant|
      if applicant.phd?
        StatusMailer.reject_email_phd(applicant).deliver_later
      else
        StatusMailer.reject_email(applicant).deliver_later
      end
    end
  end
end
