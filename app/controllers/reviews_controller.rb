class ReviewsController < ApplicationController
  load_and_authorize_resource
  layout 'reviews'

  def index
    @reviewers = User.reviewers
    @applicants = User.submitted.includes(:reviews).references(:reviews)

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