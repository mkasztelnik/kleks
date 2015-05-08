class UpdateReviewersService
  def initialize(reviewers_hsh)
    @reviewers_hsh = reviewers_hsh || {}
  end

  def execute
    applicants = User.applicants.includes(:reviews).references(:reviews)
    applicants.each do |applicant|
      reviewer_ids = @reviewers_hsh[applicant.id.to_s] || []
      existing_reviewer_ids = applicant.reviews.map(&:reviewer_id).map(&:to_s)
      to_add = reviewer_ids - existing_reviewer_ids
      to_remove = existing_reviewer_ids - reviewer_ids

      applicant.reviews.where(reviewer_id: to_remove).destroy_all

      to_add.each do |reviewer_id|
        applicant.reviews.create(reviewer_id: reviewer_id)
      end
    end
  end
end
