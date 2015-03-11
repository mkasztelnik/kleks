class ReviewsController < ApplicationController
  layout 'reviews'

  def index
    @reviewers = User.reviewers
    @applicants = User.applicants.includes(:reviews).references(:reviews)

    @existing_reviewers_hsh = {}
    @applicants.each do |applicant|
      @existing_reviewers_hsh[applicant.id] =
        applicant.reviews.map(&:reviewer_id)
    end
  end

  def show
    redirect_to review_general_path(review_id: params[:id])
  end

  def create
    UpdateReviewersService.new(params[:reviews]).execute

    redirect_to reviews_path, notice: I18n.t('reviews.assigned')
  end
end